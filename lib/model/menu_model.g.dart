// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      restaurantChain: json['restaurantChain'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'restaurantChain': instance.restaurantChain,
      'image': instance.image,
    };
