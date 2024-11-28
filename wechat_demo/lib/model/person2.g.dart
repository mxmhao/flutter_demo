// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Person2Impl _$$Person2ImplFromJson(Map<String, dynamic> json) =>
    _$Person2Impl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$$Person2ImplToJson(_$Person2Impl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
    };
