part of 'config.dart';

class ThemeClass {
  static void setRotations({List<DeviceOrientation>? listdeviceOrientations}) {
    // [
    //   DeviceOrientation.portraitUp,
    // ]

    listdeviceOrientations ??= [
      DeviceOrientation.portraitUp,
    ];

    SystemChrome.setPreferredOrientations(listdeviceOrientations);
  }

  static TextStyle setStyle(
      {Color? textColor,
      FontWeight? fontWeight,
      double? fontSize,
      double? letterSpacing,
      double? height,
      TextDecoration? textDecoration}) {
    textColor ??= textColor;
    letterSpacing ??= 0.2;
    return GoogleFonts.ptSans(
        color: textColor,
        fontSize: fontSize,
        height: height,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? FontWeight.normal);
  }
}
