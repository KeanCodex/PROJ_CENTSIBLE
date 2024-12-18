class AppDirectory {
  static const String _IMG = 'assets/images/';
  static const String _ICON = 'assets/icons/';
  static const String _ICON_CATEGORY = 'assets/icons/category/';

  static const String _GIF = 'assets/gifs/';
  static const String _LOGO = 'assets/logo/';

  static img(String file) {
    return _IMG + file;
  }

  static icon(String file) {
    return _ICON + file;
  }

  static iconCategory(String file) {
    return _ICON_CATEGORY + file;
  }

  static gif(String file) {
    return _GIF + file;
  }

  static logo(String file) {
    return _LOGO + file;
  }
}
