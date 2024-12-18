import 'package:censible_app/model/CATEGORY/category_model.dart';
import 'package:censible_app/utils/_initApp.dart';

final icon = Application().iconCategory;

List<CategoryModel> listCategory = [
  CategoryModel(
    id: '1',
    name: 'Income',
    type: 'INCOME',
    icon: icon.COFFEE,
  ),
  CategoryModel(
    id: '2',
    name: 'Food',
    type: 'EXPENSE',
    icon: icon.FOOD,
  ),
  CategoryModel(
    id: '3',
    name: 'Transportation',
    type: 'EXPENSE',
    icon: icon.TRANSPORTATION,
  ),
];
