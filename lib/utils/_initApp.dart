import 'package:censible_app/utils/custom_styles.dart';
import 'package:censible_app/utils/directories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

mixin class Application {
  AppLogo get logo => AppLogo();
  AppImage get image => AppImage();
  AppColor get color => AppColor();
  AppStyle get style => AppStyle();
  AppIcon get icon => AppIcon();
  AppGif get gif => AppGif();
  DarkColor get dark => DarkColor();
  AppCategory_Icon get iconCategory => AppCategory_Icon();
}

class AppLogo {
  String get Logo_A => AppDirectory.logo('Logo_A.png');
}

class AppCategory_Icon {
  String get ACCESSORIES => AppDirectory.iconCategory('ACCESSORIES_ICON.png');
  String get APPLIANCES => AppDirectory.iconCategory('APPLIANCES_ICON.png');
  String get AWARD => AppDirectory.iconCategory('AWARD_ICON.png');
  String get BABY => AppDirectory.iconCategory('BABY_ICON.png');
  String get BOOK => AppDirectory.iconCategory('BOOK_ICON.png');
  String get CAMP => AppDirectory.iconCategory('CAMP_ICON.png');
  String get CAPITAL => AppDirectory.iconCategory('CAPITAL_ICON.png');
  String get CAR => AppDirectory.iconCategory('CAR_ICON.png');
  String get CLOTHES => AppDirectory.iconCategory('CLOTHES_ICON.png');
  String get COFFEE => AppDirectory.iconCategory('COFFEE_ICON.png');
  String get DEPTCARD => AppDirectory.iconCategory('DEPTCARD_ICON.png');
  String get EDUCATION => AppDirectory.iconCategory('EDUCATION_ICON.png');
  String get ELECTRICITY => AppDirectory.iconCategory('ELECTRICITY_ICON.png');
  String get FOOD => AppDirectory.iconCategory('FOOD_ICON.png');
  String get FREELANCE => AppDirectory.iconCategory('FREELANCE_ICON.png');
  String get GAME => AppDirectory.iconCategory('GAME_ICON.png');
  String get GAS => AppDirectory.iconCategory('GAS_ICON.png');
  String get GYM => AppDirectory.iconCategory('GYM_ICON.png');
  String get HAIRCUT => AppDirectory.iconCategory('HAIRCUT_ICON.png');
  String get HEALTH => AppDirectory.iconCategory('HEALTH_ICON.png');
  String get HOUSE => AppDirectory.iconCategory('HOUSE_ICON.png');
  String get INSURANCE => AppDirectory.iconCategory('INSURANCE_ICON.png');
  String get INTERTAINMENT =>
      AppDirectory.iconCategory('INTERTAINMENT_ICON.png');
  String get LAUNDRY => AppDirectory.iconCategory('LAUNDRY_ICON.png');
  String get LOTTERY => AppDirectory.iconCategory('LOTTERY_ICON.png');
  String get MEMORY => AppDirectory.iconCategory('MEMORY_ICON.png');
  String get NEWSPAPER => AppDirectory.iconCategory('NEWSPAPER_ICON.png');
  String get PETCARE => AppDirectory.iconCategory('PETCARE_ICON.png');
  String get PRESENT => AppDirectory.iconCategory('PRESENT_ICON.png');
  String get PURSE => AppDirectory.iconCategory('PURSE_ICON.png');
  String get RADIO => AppDirectory.iconCategory('RADIO_ICON.png');
  String get RECYCLE => AppDirectory.iconCategory('RECYCLE_ICON.png');
  String get RENT => AppDirectory.iconCategory('RENT_ICON.png');
  String get SALES => AppDirectory.iconCategory('SALES_ICON.png');
  String get SECURITY => AppDirectory.iconCategory('SECURITY_ICON.png');
  String get SHOPPING => AppDirectory.iconCategory('SHOPPING_ICON.png');
  String get SPORTS => AppDirectory.iconCategory('SPORTS_ICON.png');
  String get TAX => AppDirectory.iconCategory('TAX_ICON.png');
  String get TELEPHONE => AppDirectory.iconCategory('TELEPHONE_ICON.png');
  String get TICKET => AppDirectory.iconCategory('TICKET_ICON.png');
  String get TOOLS => AppDirectory.iconCategory('TOOLS_ICON.png');
  String get TRANSPORTATION =>
      AppDirectory.iconCategory('TRANSPORTATION_ICON.png');
  String get TRAVEL => AppDirectory.iconCategory('TRAVEL_ICON.png');
  String get WATER => AppDirectory.iconCategory('WATER_ICON.png');
  String get WIFI => AppDirectory.iconCategory('WIFI_ICON.png');
}

class AppIcon {
  String get BUDGET => AppDirectory.icon('BUDGET_ICON.png');
  String get TRACKING => AppDirectory.icon('TRACKING_ICON.png');
  String get INSIGHT => AppDirectory.icon('INSIGHT_ICON.png');
  String get SAVING => AppDirectory.icon('SAVING_ICON.png');
  String get LOGO => AppDirectory.icon('LOGO_IMG.png');
  String get PHONE => AppDirectory.icon('PHONE_IMG.png');

  // # Authetication Icons
  String get GOOGLE => AppDirectory.icon('GOOGLE_ICON.png');
  String get FACEBOOK => AppDirectory.icon('FACEBOOK_ICON.png');
  String get INSTAGRAM => AppDirectory.icon('INSTAGRAM_ICON.png');

  // # Bottom Navigation Icons Fill
  String get RECORD_FILL => AppDirectory.icon('RECEIPT_FILL_ICON.png');
  String get ANALYSIS_FILL => AppDirectory.icon('PIE_FILL_ICON.png');
  String get BUDGET_FILL => AppDirectory.icon('CALCULATOR_FILL_ICON.png');
  String get ACCOUNTS_FILL => AppDirectory.icon('WALLET_FILL_ICON.png');
  String get CATEGORY_FILL => AppDirectory.icon('TAGS_FILL_ICON.png');

  // # Bottom Navigation Icons Line
  String get RECORD_LINE => AppDirectory.icon('RECEIPT_LINE_ICON.png');
  String get ANALYSIS_LINE => AppDirectory.icon('PIE_LINE_ICON.png');
  String get BUDGET_LINE => AppDirectory.icon('CALCULATOR_LINE_ICON.png');
  String get ACCOUNTS_LINE => AppDirectory.icon('WALLET_LINE_ICON.png');
  String get CATEGORY_LINE => AppDirectory.icon('TAGS_LINE_ICON.png');

  // # Accounts Icons
  String get MONEY => AppDirectory.icon('CASH_ICON.png');
  String get CARD => AppDirectory.icon('CARD_ICON.png');
  String get SAVINGS => AppDirectory.icon('SAVINGS_ICON.png');
  String get MASTER => AppDirectory.icon('MASTER_CARD_ICON.png');
  String get VISA => AppDirectory.icon('VISA_CARD_ICON.png');
  String get COINS => AppDirectory.icon('COINS_ICON.png');
  String get WALLET => AppDirectory.icon('WALLET_FILL_ICON.png');
}

class AppGif {
  // String get LOGO => AppDirectory.gif('LOGO.gif');
  String get SPLASH_BACK => AppDirectory.gif('SPLASH_BACKGROUND.gif');

  // # Validation
  String get VALID => AppDirectory.gif('VALID.gif');
  String get INVALID => AppDirectory.gif('INVALID.gif');
  String get WARNING => AppDirectory.gif('WARNING.gif');
  String get LOADING => AppDirectory.gif('LOADING.gif');
  String get REGISTER => AppDirectory.gif('REGISTER.gif');
  String get REMOVE => AppDirectory.gif('REMOVE.gif');
  String get NO_DATA => AppDirectory.gif('NO_DATA.gif');
}

class AppImage {
  String get SPLASH_BACK => AppDirectory.img('SPLASH_BACK.png');
  String get STARTED_BACK => AppDirectory.img('STARTED_BACK.png');
  String get LIGHT_BACK => AppDirectory.img('LIGHT_BACK.png');
}

class DarkColor {
  Color get dark => const Color(0xFF000000); // Pure black
  Color get darkGray => const Color(0xFF212121); // Dark grayish black
  Color get charcoalBlack => const Color(0xFF2C2C2C); // Deep grayish black
  Color get jetBlack => const Color(0xFF343434); // Very dark gray
  Color get onyx => const Color(0xFF353839); // Cool, bluish black
  Color get gunmetal =>
      const Color(0xFF2A3531); // Black with a slight blue-green tint
  Color get ravenBlack => const Color(0xFF5D5D5D); // Neutral dark blackish-gray
  Color get slateBlack => const Color(0xFF484848); // Deep slate gray
  Color get oliveBlack => const Color(0xFF3B3A36); // Greenish black
  Color get lightCharcoal => const Color(0xFF4F4F4F); // Lighter charcoal black
  Color get dimGray => const Color(0xFF696969); // Medium-dark gray
  Color get ashenBlack =>
      const Color(0xFF6B6B6B); // Lighter black with ashy tone
  Color get ashGray => const Color(0xFFB2B2B2); // Light gray, faded black
  Color get silverBlack => const Color(0xFF4B4B4B); // Dark metallic silver
  Color get slateGray =>
      const Color(0xFF708090); // Light gray with blue undertones
}

class AppColor {
  // # LIST COLOR OF WHITE
  Color get white => const Color(0xFFFFFFFF);
  Color get primary => const Color(0xFF33D2AE);
  Color get primaryDark => const Color(0xFF004952);
  Color get primarylight => const Color(0xFFCEF3E6);
  Color get invalid => const Color(0xFFF15A59);
  Color get warning => const Color(0xFFFFC107);
  Color get valid => const Color(0xFF75AE87);
  Color get peach => const Color(0xFFCEF3E6);
  // # LIST COLOR OF BLACK

  // Nested ColorCategory class for dark shades

  // # BACKGROUND
  Color get background => const Color(0xFFF1E4D4);
  Color get backlight => const Color(0xFFF3F3E0);
  Color get lightback => const Color(0xFFF1E4D4);

  Color get whiteOpacity10 => const Color(0xFFFFFFFF).withOpacity(0.1);
  Color get whiteOpacity20 => const Color(0xFFFFFFFF).withOpacity(0.2);
  Color get whiteOpacity30 => const Color(0xFFFFFFFF).withOpacity(0.3);
  Color get whiteOpacity40 => const Color(0xFFFFFFFF).withOpacity(0.4);
  Color get whiteOpacity50 => const Color(0xFFFFFFFF).withOpacity(0.5);
  Color get whiteOpacity60 => const Color(0xFFFFFFFF).withOpacity(0.6);
  Color get whiteOpacity70 => const Color(0xFFFFFFFF).withOpacity(0.7);
  Color get whiteOpacity80 => const Color(0xFFFFFFFF).withOpacity(0.8);

  Color get darkOpacity10 => const Color(0xFF000000).withOpacity(0.1);
  Color get darkOpacity20 => const Color(0xFF000000).withOpacity(0.2);
  Color get darkOpacity30 => const Color(0xFF000000).withOpacity(0.3);
  Color get darkOpacity40 => const Color(0xFF000000).withOpacity(0.4);
  Color get darkOpacity50 => const Color(0xFF000000).withOpacity(0.5);
  Color get darkOpacity60 => const Color(0xFF000000).withOpacity(0.6);
  Color get darkOpacity70 => const Color(0xFF000000).withOpacity(0.7);
  Color get darkOpacity80 => const Color(0xFF000000).withOpacity(0.8);
}

class AppStyle with CustomTextStyle, CustomButtonStyle, CustBorder {}
