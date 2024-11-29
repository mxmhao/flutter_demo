import 'package:dio/dio.dart';
import 'dart:convert';

// 模型
// class User {
//   String? name;
//   String? imageUrl;
//   String? msg;
//
//   User({this.name, this.imageUrl, this.msg});
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//       'name': String name,
//       'imageUrl': String imageUrl,
//       'msg': String msg,
//       } =>
//           User(
//             name: name,
//             imageUrl: imageUrl,
//             msg: msg,
//           ),
//       _ => throw const FormatException('Failed to load album.'),
//     };
//   }
// }
//
// final dio = Dio();
//
// @riverpod
// Future<List<User>> fetchUsers() async {
//   final response = await dio.get("http://rap2api.taobao.org/app/mock/320403/user");
//   // print(response.statusCode);
//   // print(response.data);
//   if (response.statusCode == 200) {
//     var resp = json.decode(response.data.toString());
//     return (resp["chat_list"] as List<dynamic>)
//         .map<User>((item) { return User.fromJson(item);})
//         .toList();
//   } else {
//     throw Exception("statusCode == ${response.statusCode}");
//   }
// }