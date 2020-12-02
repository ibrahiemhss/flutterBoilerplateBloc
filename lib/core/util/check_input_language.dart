import 'dart:ui';

class CheckInputKeyBoard {
  static bool isArabic;

  static TextDirection textDirection(
      String string, String local, bool forceEn) {
    if (local == null) {
      isArabic = false;
    } else if (forceEn) {
      isArabic = false;
    } else {
      print('-----------| Local with iput is =$local |---------');
      if (local == 'ar') {
        isArabic = true;
      } else {
        isArabic = false;
      }
    }

    TextDirection mtextDirection;

    Pattern pattern =
        r'^[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*().]';

    RegExp regex = new RegExp(pattern);

    if (forceEn) {
      mtextDirection = TextDirection.ltr;
    } else {
      if (string != null) {
        if (string.trim().length > 0) {
          print(
              '-----------| last value of iput is =${string.substring(string.trim().length - 1)} |---------');

          if (regex.hasMatch(string.substring(string.trim().length - 1))) {
            print('-----------|  value of iput is = ENGLISH |---------');

            isArabic = true;
            mtextDirection = TextDirection.ltr;
          } else {
            print('-----------|  value of iput is = ARABIC |---------');

            isArabic = false;

            mtextDirection = TextDirection.rtl;
          }
        } else {
          mtextDirection = TextDirection.rtl;
        }
      } else {
        mtextDirection = TextDirection.rtl;
      }
    }

    return mtextDirection;
  }
}
