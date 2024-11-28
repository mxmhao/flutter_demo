import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 必要的：关联 `main.dart` 到 Freezed 代码生成器
part 'company.freezed.dart';
// 可选的：因为 Person 类是可序列化的，所以我们必须添加这一行。
// 但是如果 Person 不是可序列化的，我们可以跳过它。
// part 'company.g.dart';

@freezed
class Company with _$Company {
  factory Company({String? name, required Director director}) = _Company;
}

@freezed
class Director with _$Director {
  factory Director({String? name, Assistant? assistant}) = _Director;
}

@freezed
class Assistant with _$Assistant {
  // @Assert("age >= 0")
  factory Assistant({String? name, int? age}) = _Assistant;
}

void coyymycom() {
  Company company = Company(director: Director());
  // company.copyWith.director.assistant(name: "");
  company.copyWith.director.assistant?.call(name: "");
}