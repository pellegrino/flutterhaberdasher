///
//  Generated code. Do not modify.
//  source: rpc/haberdasher/service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Size$json = const {
  '1': 'Size',
  '2': const [
    const {'1': 'inches', '3': 1, '4': 1, '5': 5, '10': 'inches'},
  ],
};

const Hat$json = const {
  '1': 'Hat',
  '2': const [
    const {'1': 'inches', '3': 1, '4': 1, '5': 5, '10': 'inches'},
    const {'1': 'color', '3': 2, '4': 1, '5': 9, '10': 'color'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

const HaberdasherServiceBase$json = const {
  '1': 'Haberdasher',
  '2': const [
    const {
      '1': 'MakeHat',
      '2': '.kitanda.api.haberdasher.Size',
      '3': '.kitanda.api.haberdasher.Hat'
    },
  ],
};

const HaberdasherServiceBase$messageJson = const {
  '.kitanda.api.haberdasher.Size': Size$json,
  '.kitanda.api.haberdasher.Hat': Hat$json,
};
