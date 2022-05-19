// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_placeholder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPlaceHolder _$PostPlaceHolderFromJson(Map<String, dynamic> json) =>
    PostPlaceHolder(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$PostPlaceHolderToJson(PostPlaceHolder instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
