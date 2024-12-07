

import 'package:flutter/material.dart';

class SBottomSheetTheme{
SBottomSheetTheme._();

static final lightBottomSheetTheme = BottomSheetThemeData(
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
 backgroundColor: Colors.white,
 modalBackgroundColor: Colors.white,
 constraints: const BoxConstraints(minWidth: double.infinity),
 
);

static final darkBottomSheetTheme = BottomSheetThemeData(
 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
 backgroundColor: Colors.white,
 modalBackgroundColor: Colors.white,
 constraints: const BoxConstraints(minWidth: double.infinity),
 
);
}