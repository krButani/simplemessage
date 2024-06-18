// ignore_for_file: duplicate_import

library krButani;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

part 'lang.dart';
part 'DB.dart';
part 'themeclass.dart';



const Color kbgColor = Color(0xFFFFFFFF);
const Color kPrimaryColor = Color(0xFF68548E);
const Color kPrimaryAppColor = Color(0xFF230F46);
const Color textPlaceholderColor = Color.fromRGBO(66, 66, 66, 1);
const Color textColor = Color(0xFF1F1F1F);
const Color texthintColor = Color.fromRGBO(106, 106, 106, 1.0);

const Color borderColor = Color(0xFFE8E8E8);
const Color shadowColor = Color.fromARGB(255, 224, 224, 224);

const Color expiryColor = Color(0xFFFF9C29);
const Color activeColor = Color(0xFF5BC940);
const Color inactiveColor = Color(0xFFFF2929);
const Color buttonshadowColor = Color(0xFF454545);

//section color
const Color redColor = Color(0xFFc23e2e);
const Color redFontsColor = Color.fromARGB(255, 255, 219, 214);
const Color pinkColor = Color(0xFFa12a60);
const Color pinkFontsColor = Color.fromARGB(255, 255, 203, 227);
const Color blue1Color = Color(0xFF4d67d4);
const Color blue1FontsColor = Color.fromARGB(255, 229, 226, 255);
const Color greenColor = Color.fromRGBO(5, 162, 141, 1);
const Color greenFontsColor = Color.fromRGBO(200, 255, 248, 1);
const Color lemonYellowColor = Color(0xFFFFFACD);
const Color grayDotColor = Color(0xFFE8E8E8);
const Color starndedMaroonColor = Color(0xFFB1005B);
const Color starndedBlueColor = Color(0xFF3183FF);

const Color shimmerbgColor = Color(0xFFCCCCCC);
const Color shimmerOverColor = Color(0xFFF4F4F4);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(4285027470),
  surfaceTint: Color(4285027470),
  onPrimary: Color(4294967295),
  primaryContainer: Color(4293647871),
  onPrimaryContainer: Color(4280487750),
  secondary: Color(4284701552),
  onSecondary: Color(4294967295),
  secondaryContainer: Color(4293517048),
  onSecondaryContainer: Color(4280227883),
  tertiary: Color(4286468701),
  onTertiary: Color(4294967295),
  tertiaryContainer: Color(4294957537),
  onTertiaryContainer: Color(4281405467),
  error: Color(4290386458),
  onError: Color(4294967295),
  errorContainer: Color(4294957782),
  onErrorContainer: Color(4282449922),
  background: Color(4294899711),
  onBackground: Color(4280097568),
  surface: Color(4294899711),
  onSurface: Color(4280097568),
  surfaceVariant: Color(4293386475),
  onSurfaceVariant: Color(4282991950),
  outline: Color(4286215551),
  outlineVariant: Color(4291544271),
  shadow: Color(4278190080),
  scrim: Color(4278190080),
  inverseSurface: Color(4281478965),
  inversePrimary: Color(4292066557),
  primaryFixed: Color(4293647871),
  onPrimaryFixed: Color(4280487750),
  primaryFixedDim: Color(4292066557),
  onPrimaryFixedVariant: Color(4283383156),
  secondaryFixed: Color(4293517048),
  onSecondaryFixed: Color(4280227883),
  secondaryFixedDim: Color(4291674843),
  onSecondaryFixedVariant: Color(4283122520),
  tertiaryFixed: Color(4294957537),
  onTertiaryFixed: Color(4281405467),
  tertiaryFixedDim: Color(4293965765),
  onTertiaryFixedVariant: Color(4284758854),
  surfaceDim: Color(4292794592),
  surfaceBright: Color(4294899711),
  surfaceContainerLowest: Color(4294967295),
  surfaceContainerLow: Color(4294504954),
  surfaceContainer: Color(4294110452),
  surfaceContainerHigh: Color(4293781230),
  surfaceContainerHighest: Color(4293386472),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(4283119984),
  surfaceTint: Color(4285027470),
  onPrimary: Color(4294967295),
  primaryContainer: Color(4286540453),
  onPrimaryContainer: Color(4294967295),
  secondary: Color(4282859348),
  onSecondary: Color(4294967295),
  secondaryContainer: Color(4286148999),
  onSecondaryContainer: Color(4294967295),
  tertiary: Color(4284430146),
  onTertiary: Color(4294967295),
  tertiaryContainer: Color(4288112500),
  onTertiaryContainer: Color(4294967295),
  error: Color(4287365129),
  onError: Color(4294967295),
  errorContainer: Color(4292490286),
  onErrorContainer: Color(4294967295),
  background: Color(4294899711),
  onBackground: Color(4280097568),
  surface: Color(4294899711),
  onSurface: Color(4280097568),
  surfaceVariant: Color(4293386475),
  onSurfaceVariant: Color(4282728778),
  outline: Color(4284636519),
  outlineVariant: Color(4286478723),
  shadow: Color(4278190080),
  scrim: Color(4278190080),
  inverseSurface: Color(4281478965),
  inversePrimary: Color(4292066557),
  primaryFixed: Color(4286540453),
  onPrimaryFixed: Color(4294967295),
  primaryFixedDim: Color(4284830347),
  onPrimaryFixedVariant: Color(4294967295),
  secondaryFixed: Color(4286148999),
  onSecondaryFixed: Color(4294967295),
  secondaryFixedDim: Color(4284504174),
  onSecondaryFixedVariant: Color(4294967295),
  tertiaryFixed: Color(4288112500),
  onTertiaryFixed: Color(4294967295),
  tertiaryFixedDim: Color(4286336859),
  onTertiaryFixedVariant: Color(4294967295),
  surfaceDim: Color(4292794592),
  surfaceBright: Color(4294899711),
  surfaceContainerLowest: Color(4294967295),
  surfaceContainerLow: Color(4294504954),
  surfaceContainer: Color(4294110452),
  surfaceContainerHigh: Color(4293781230),
  surfaceContainerHighest: Color(4293386472),
);

// Toast Color
const Color tErrorColor = Color(0xFFEF5350);
const Color tInfoColor = Color(0xFF29B6F6);
const Color tSuccessColor = Color(0xFF66BB6A);
const Color tWarningColor = Color(0xFFFFA726);
const Color tWhiteColor = Color(0xFFFFFFFF);

void kbNToast(msg, which, context) {
  if (which == null) which = 'e';
  if (which == 'e') {
    showToast(
      msg,
      context: context,
      backgroundColor: tErrorColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  } else if (which == 's') {
    showToast(
      msg,
      context: context,
      backgroundColor: tSuccessColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  } else if (which == 'w') {
    showToast(
      msg,
      context: context,
      backgroundColor: tWarningColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  } else if (which == 'i') {
    showToast(
      msg,
      context: context,
      backgroundColor: tInfoColor,
      isHideKeyboard: true,
      textStyle: TextStyle(color: tWhiteColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
}
