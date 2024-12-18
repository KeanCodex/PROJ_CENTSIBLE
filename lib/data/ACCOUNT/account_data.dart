import 'package:censible_app/model/ACCOUNT/account_model.dart';
import 'package:censible_app/utils/_initApp.dart';

final icon = Application().icon;

List<AccountModel> listAccount = [
  AccountModel(
    id: '1',
    name: 'MONEY',
    amount: 250.0,
    balance: 250.0,
    icon: icon.MONEY,
  ),
  AccountModel(
    id: '2',
    name: 'Savings',
    amount: 250.0,
    balance: 250.0,
    icon: icon.SAVINGS,
  ),
  AccountModel(
    id: '3',
    name: 'SSS CARD',
    amount: 250.0,
    balance: 250.0,
    icon: icon.CARD,
  ),
];
