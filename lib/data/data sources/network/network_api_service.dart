// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart' as http;
//
// import '../../../core/constant/enums.dart';
// import '../../../core/utils/extension.dart';
// import '../../exceptions/app_exception.dart';
//
// typedef MapSS = Map<String, String>;
// typedef ResponseType = Map<String, dynamic>;
//
// class NetworkApiServices {
//   // SEND HTTP REQUEST WITH HEADER
//   Future sendHttpRequest(
//       {required Uri url, required HttpMethod method, MapSS? body}) async {
//     final uri = url;
//     if (body != null) (body).log(uri.path);
//     dynamic responseJson;
//     final getHeader = {"Bearer": "Bearer"};
//     try {
//       late final http.Request request;
//       switch (method) {
//         case HttpMethod.get:
//           request = http.Request('GET', uri);
//           request.headers.addAll(getHeader);
//           break;
//         case HttpMethod.post:
//           request = http.Request('POST', uri);
//           if (body != null) {
//             request.bodyFields = body;
//           }
//           request.headers.addAll(getHeader);
//           break;
//         case HttpMethod.put:
//           request = http.Request('PUT', uri);
//           request.body = json.encode(body);
//           request.headers.addAll(getHeader);
//           break;
//         case HttpMethod.delete:
//           request = http.Request('DELETE', uri);
//           if (body != null) {
//             request.bodyFields = body;
//           }
//           request.headers.addAll(getHeader);
//           break;
//       }
//
//       http.StreamedResponse streamedResponse = await request.send();
//       http.Response response = await http.Response.fromStream(streamedResponse);
//       //  (response.body).log();
//       responseJson = errorHandling(response);
//       (response.statusCode).log(response.request!.url.path.toString());
//       return responseJson;
//     } on SocketException {
//       throw FetchDataException("No Internet Connection");
//     }
//   }
//
//   // SEND HTTP REQUEST WITHOUT HEADER
//   Future sendHttpRequestWithoutToken(
//       {required Uri url, required HttpMethod method, MapSS? body}) async {
//     final uri = url;
//     if (body != null) (body).log(uri.path);
//     dynamic responseJson;
//     try {
//       late final http.Request request;
//       switch (method) {
//         case HttpMethod.get:
//           request = http.Request('GET', uri);
//           break;
//         case HttpMethod.post:
//           request = http.Request('POST', uri);
//           if (body != null) {
//             request.bodyFields = body;
//           }
//           break;
//         case HttpMethod.put:
//           request = http.Request('PUT', uri);
//           request.body = json.encode(body);
//           break;
//         case HttpMethod.delete:
//           request = http.Request('DELETE', uri);
//           if (body != null) {
//             request.bodyFields = body;
//           }
//           break;
//       }
//       request.headers.addAll({'Accept': 'application/json'});
//       http.StreamedResponse streamedResponse = await request.send();
//       http.Response response = await http.Response.fromStream(streamedResponse);
//       // (response.body).log();
//       (response.statusCode).log(response.request!.url.path.toString());
//       return _handleResponse(response);
//       // responseJson = errorHandling(response, allowUnauthorizedResponse);
//       // return responseJson;
//     } on SocketException {
//       throw FetchDataException("No Internet Connection");
//     }
//   }
//
//   // Handle the HTTP response
//   Map<String, dynamic> _handleResponse(http.Response response) {
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
//
//   // ERROR HANDLING
//   Map<String, dynamic> errorHandling(http.Response response) {
//     final code = response.statusCode;
//     dynamic responseJson = code != 500 ? jsonDecode(response.body) : null;
//     switch (response.statusCode) {
//       case 200:
//         return responseJson;
//       case 201:
//         return responseJson;
//       case 400:
//         throw FetchDataException(response.statusCode.toString());
//       case 401:
//         throw UnauthorizedException();
//       case 404:
//         throw FetchDataException(response.statusCode.toString());
//       case 500:
//         throw InternalSeverException("");
//       default:
//         throw Exception('Failed to load data: ${response.statusCode}');
//     }
//   }
// }
