import 'package:censible_app/model/ACCOUNT/account_model.dart';
import 'package:censible_app/model/CATEGORY/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecordModel {
  String? id;
  String? type;
  AccountModel? account; // Reference to AccountModel
  CategoryModel? category; // Reference to CategoryModel
  String? notes;
  double? calculation;
  DateTime? dateTime;
  String? time;
  String? inputValue;

  // Constructor
  RecordModel({
    required this.id,
    required this.type,
    required this.account,
    required this.category,
    required this.notes,
    required this.calculation,
    required this.dateTime,
    required this.time,
    required this.inputValue,
  });

  @override
  String toString() {
    return 'RecordModel{id: $id, type: $type, account: $account, category: $category, notes: $notes, calculation: $calculation, dateTime: $dateTime, time: $time, inputValue: $inputValue}';
  }

  // Convert RecordModel to Map (For saving to Firestore, for example)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'inputValue': inputValue,
      'account': account?.toMap(), // AccountModel to Map
      'category': category?.toMap(), // CategoryModel to Map
      'notes': notes,
      'calculation': calculation,
      'dateTime':
          dateTime?.toIso8601String(), // Convert DateTime to ISO 8601 string
      'time': time,
    };
  }

  // Convert Firestore DocumentSnapshot to RecordModel
  factory RecordModel.fromFirestore(DocumentSnapshot doc) {
    return RecordModel(
      id: doc.id,
      type: doc.get('type'),
      inputValue: doc.get('inputValue'),
      account: doc.get('account') != null
          ? AccountModel.fromFirestore(doc.get('account'))
          : null, // Using AccountModel from Firestore
      category: doc.get('category') != null
          ? CategoryModel.fromFirestore(doc.get('category'))
          : null, // Using CategoryModel from Firestore
      notes: doc.get('notes'),
      calculation: doc.get('calculation'),
      dateTime: doc.get('dateTime') != null
          ? DateTime.parse(doc.get('dateTime'))
          : null,
      time: doc.get('time'),
    );
  }
}
