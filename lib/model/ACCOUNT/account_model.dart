import 'package:cloud_firestore/cloud_firestore.dart';

class AccountModel {
  String? id;
  String? name;
  double? amount;
  double? balance;
  String? icon;

  AccountModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.balance,
    required this.icon,
  });

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, amount: $amount, balance: $balance, icon: $icon)';
  }

  // This is the method you're currently using to convert DocumentSnapshot to AccountModel
  factory AccountModel.fromFirestore(DocumentSnapshot doc) {
    return AccountModel(
      id: doc.id,
      name: doc.get('name'),
      amount: doc.get('amount'),
      balance: doc.get('balance'),
      icon: doc.get('icon'),
    );
  }

  // New method to convert a map to AccountModel
  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      balance: map['balance'],
      icon: map['icon'],
    );
  }

  // Adding the toMap() method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'balance': balance,
      'icon': icon,
    };
  }
}
