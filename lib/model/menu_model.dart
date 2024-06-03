

import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';


@freezed
class Menu with _$Menu {
  const factory Menu({
    required int id,
    required String title,
    required String restaurantChain,
    required String image,
  }) = _Menu;

  factory Menu.fromJson(Map<String, Object?> json) => _$MenuFromJson(json);


}

