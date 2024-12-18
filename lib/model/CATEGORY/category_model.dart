import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  String? name;
  String? icon;
  String? type;

  CategoryModel({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
  });

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, type: $type, icon: $icon)';
  }

  // This method will convert a Firestore DocumentSnapshot to a CategoryModel
  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    return CategoryModel(
      id: doc.id,
      name: doc.get('name'),
      type: doc.get('type'),
      icon: doc.get('icon'),
    );
  }

  // New method to convert a Map<String, dynamic> to CategoryModel
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      icon: map['icon'],
    );
  }

  // Adding the toMap() method for converting CategoryModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'icon': icon,
    };
  }
}
