import 'package:flutterhaberdasher/bloc/haberdasher_bloc.dart';
import 'package:flutterhaberdasher/model/rpc/haberdasher/service.twirp.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:twirp_dart_core/twirp_dart_core.dart';

class MockHaberdasherClient extends Mock implements Haberdasher {}

void main() {
  HaberdasherBloc bloc;
  MockHaberdasherClient mockHaberdasherClient;

  setUp(() {
    mockHaberdasherClient = MockHaberdasherClient();
    bloc = HaberdasherBloc(
      client: mockHaberdasherClient,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test("initial state is empty", () {
    expect(bloc.initialState, equals(HatInitial()));
  });

  group("MakeHat", () {
    Hat hat;
    Size wrongSize;

    setUp(() {
      wrongSize = Size(-1);
      hat = Hat(12, 'red', 'bower');
    });

    blocTest("calls the haberdasher API when starting",
        build: () => bloc,
        act: (bloc) => bloc.add(MakeHatStarted(size: Size(12))),
        verify: (_) => verify(mockHaberdasherClient.makeHat(any)).called(1));
    blocTest("emits a [hat] when MakeHatStarted is added",
        build: () => bloc,
        act: (bloc) {
          when(mockHaberdasherClient.makeHat(any)).thenAnswer((_) async => hat);
          bloc.add(MakeHatStarted(size: Size(12)));
        },
        expect: [isA<HatLoaded>()]);

    blocTest(
      "emits a HatError when an TwirpException is received",
      build: () => bloc,
      act: (bloc) {
        when(mockHaberdasherClient.makeHat(wrongSize))
            .thenThrow(TwirpJsonException('200', 'wrong size', ' '));
        bloc.add(MakeHatStarted(size: wrongSize));
      },
      expect: [isA<HatError>()],
    );
  });
}
