import 'dart:async';

import 'package:floor/floor.dart';
@Entity(tableName: 'Specialties')
class Specialization {
  int id;
  String name;
  String description;
  String icon;
  String color;
  @PrimaryKey(autoGenerate: true)
  final int id_;
  Specialization({
    this.id_,
    this.id,
    this.name,
    this.description,
    this.icon,
    this.color,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return new Specialization(
      id: json['id']as int,
      name: json['name'] as String,
      description: json['description']as String,
      icon: json['icon']as String,
      color: json['color']as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id as int;
    }
    map['name'] = name as String;
    map['description'] = description as String;
    map['icon'] = icon as String;
    map['color'] = color as String;

    return map;
  }

  Specialization.fromMap(Map<String, dynamic> map)
      : id_ = map['id_'] as int,
        id = map['id'] as int,
        name = map['name'] as String,
        description = map['description'] as String,
        icon = map['icon'] as String,
        color = map['color'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'description': description,
    'icon': icon,
    'color': color
  };

}


@dao
abstract class SpecialtiesDao {
  @Query('SELECT * FROM Specialties')
  Future<List<Specialization>> findAllSpecialization();

  @Query('SELECT * FROM Specialties WHERE name = :name')
  Future<List<Specialization>>  findDataByValue(String value);
  @insert
  Future<List<int>> insertAllSpecialization(List<Specialization> listSpecialization);
  @insert
  Future<void> insertSpecialties(Specialization specialization);

  @update
  Future<int> updateAllSpecialties(List<Specialization> listSpecialization);
  @update
  Future<void> updateSpecialties(Specialization specialization);
}