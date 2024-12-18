import 'package:censible_app/model/ACCOUNT/account_model.dart';
import 'package:censible_app/model/CALCULATE/calculator_model.dart';
import 'package:censible_app/model/CATEGORY/category_model.dart';
import 'package:censible_app/utils/_initApp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordsController extends GetxController {
  var currentDate = DateTime.now();
  var listRecords = <RecordModel>[].obs;
  var totalExpenses = 0.0.obs;
  var totalIncome = 0.0.obs;
  var totalBalance = 0.0.obs;

  var color = Application();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? currentUserId;

  @override
  void onInit() {
    super.onInit();
    openUserBox();
    fetchCalculateData(); // Load all records initially
  }

  // Move to the previous month and fetch data
  void previousMonth() {
    currentDate = DateTime(currentDate.year, currentDate.month - 1, 1);
    fetchRecordsForMonth();
    update();
  }

  // Move to the next month and fetch data
  void nextMonth() {
    currentDate = DateTime(currentDate.year, currentDate.month + 1, 1);
    fetchRecordsForMonth();
    update();
  }

  // Fetch and filter records for the currently selected month
  void fetchRecordsForMonth() {
    final records = listRecords
        .where((record) =>
            record.dateTime != null &&
            record.dateTime!.year == currentDate.year &&
            record.dateTime!.month == currentDate.month)
        .toList();

    // Group records by day
    final groupedRecords = <int, List<RecordModel>>{};
    for (var record in records) {
      if (record.dateTime != null) {
        final day = record.dateTime!.day;
        if (!groupedRecords.containsKey(day)) {
          groupedRecords[day] = [];
        }
        groupedRecords[day]!.add(record);
      }
    }

    // Update total calculations
    totalExpenses.value = records
        .where((record) => record.type == 'EXPENSE')
        .fold(
            0.0, (sum, record) => sum + double.parse(record.inputValue ?? '0'));

    totalIncome.value = records.where((record) => record.type == 'INCOME').fold(
        0.0, (sum, record) => sum + double.parse(record.inputValue ?? '0'));

    totalBalance.value = totalIncome.value - totalExpenses.value;

    print('Grouped Records: $groupedRecords');
    print('Total Expenses: ${totalExpenses.value}');
    print('Total Income: ${totalIncome.value}');
    print('Total Balance: ${totalBalance.value}');

    update();
  }

  Future<void> openUserBox() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      currentUserId = user.uid;
    } else {
      showErrorSnackbar(
          'Error', 'No user is currently signed in.', Icons.error);
    }
  }

  // Fetch all data from Firestore initially
  Future<void> fetchCalculateData() async {
    if (currentUserId == null) {
      showErrorSnackbar("Error", 'User not authenticated.', Icons.error);
      return;
    }

    try {
      final userDoc =
          await _firestore.collection("USER_ACCOUNT").doc(currentUserId).get();

      if (!userDoc.exists) {
        showErrorSnackbar("Error", 'No user data found.', Icons.error);
        return;
      }

      final recordDataList =
          userDoc.get('CALCULATE_DATA') as List<dynamic>? ?? [];

      if (recordDataList.isNotEmpty) {
        listRecords.value = recordDataList
            .map((data) => RecordModel(
                id: data['id'],
                type: data['type'],
                account: data['account'] != null
                    ? AccountModel.fromMap(data['account'])
                    : null,
                category: data['category'] != null
                    ? CategoryModel.fromMap(data['category'])
                    : null,
                notes: data['notes'],
                calculation: data['calculation'],
                inputValue: data['inputValue'],
                dateTime: data['dateTime'] != null
                    ? DateTime.parse(data['dateTime'])
                    : null,
                time: data['time']))
            .toList();

        fetchRecordsForMonth(); // Display data for the current month initially
        update();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void showSnackbar(String title, String message, IconData icon) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color.color.primary,
      colorText: color.color.white,
      icon: Icon(
        icon,
        color: color.color.white,
      ),
    );
  }

  void showErrorSnackbar(String title, String message, IconData icon) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color.color.invalid,
      colorText: color.color.white,
      icon: Icon(
        icon,
        color: color.color.white,
      ),
    );
  }
}
