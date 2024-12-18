import 'package:censible_app/model/walkThru_model.dart';
import 'package:censible_app/utils/_initApp.dart';

Application _app = Application();

List<WalkthruDataModel> WALKTHRU_INFO = [
  WalkthruDataModel(
    imageAsset: _app.icon.TRACKING,
    title: 'Track Spending Easily\nEvery Single Day',
    description:
        'Easily log and categorize all your expenses. Keep a detailed record of your daily, weekly, or monthly spending habits.',
  ),
  WalkthruDataModel(
    imageAsset: _app.icon.BUDGET,
    title: 'Set Budgets For Different\nExpense Categories',
    description:
        'Create personalized budgets for different categories like groceries, entertainment, and transportation. Stay within your limits.',
  ),
  WalkthruDataModel(
    imageAsset: _app.icon.INSIGHT,
    title: 'Get Insights On Your\nExpense Trends',
    description:
        'Analyze your spending trends with insightful charts and reports. Understand where your money is going and how you can save.',
  ),
  WalkthruDataModel(
    imageAsset: _app.icon.SAVING,
    title: 'Achieve Financial Goals\nSavings Tracking',
    description:
        'Set financial goals and track your progress. Stay motivated to save for what matters most to you.',
  ),
];
