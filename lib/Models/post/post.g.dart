// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      userId: json['user_id'] as int,
      id: json['id'] as int,
      type: json['type'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
      'type': instance.type,
      'thumbnail': instance.thumbnail,
    };
