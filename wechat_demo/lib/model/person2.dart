import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 必要的：关联 `main.dart` 到 Freezed 代码生成器
part 'person2.freezed.dart';
// 可选的：因为 Person 类是可序列化的，所以我们必须添加这一行。
// 但是如果 Person 不是可序列化的，我们可以跳过它。
part 'person2.g.dart';

@unfreezed
class Person2 with _$Person2 {
  factory Person2({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person2;

  factory Person2.fromJson(Map<String, Object?> json) => _$Person2FromJson(json);
}