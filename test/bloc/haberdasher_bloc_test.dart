import 'package:flutterhaberdasher/bloc/haberdasher_bloc.dart';
import 'package:flutterhaberdasher/model/rpc/haberdasher/service.twirp.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

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
  test("initial state is empty", () {
    expect(bloc.initialState, equals(HatInitial()));
  });

  group("MakeHat", () {
    blocTest("calls the haberdasher API when starting",
        build: () => bloc,
        act: (bloc) => bloc.add(MakeHatStarted(size: Size(12))),
        verify: (_) => verify(mockHaberdasherClient.makeHat(any)).called(1));
  });
}
