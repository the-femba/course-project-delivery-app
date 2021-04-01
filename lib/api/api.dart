export 'package:cp_delivery/api/api_service.dart';
export 'package:cp_delivery/api/auth_api_binder.dart';

// class ShowsResult {
//   final String name;
//   final int years;
//
//   ShowsResult({
//     this.name,
//     this.years,
//   });
// }
//
// class ShowsBinding {
//   final Dio _client = Dio();
//
//   Future<ShowsResult> send(String name) async {
//     var result = await _client.get(
//       'http://localhost:8000/getShows',
//       queryParameters: {
//         'name': name,
//       },
//     );
//
//     if (result.data == 'error') {
//       throw Exception();
//     }
//
//     return ShowsResult(
//       name: result.data['name'] as String,
//       years: result.data['years'] as int,
//     );
//   }
// }
//
// void build() async {
//   try {
//     var shows = await ShowsBinding().send('felix');
//   } on Exception {
//     print('error');
//   }
// }
