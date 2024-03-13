import 'package:flutter/material.dart';
import 'package:flutter_pos/ui/shared/ui_config.dart';

class ThemeConfig {
  static InputDecoration outlineTextFieldPrimary(String hint) {
    return InputDecoration(
      isDense: true,
      hintText: hint,
      border: const OutlineInputBorder(
        borderRadius: boderRadiusAll10,
      ),
    );
  }

  // === Text Style === //
  static TextStyle titleLarge(){
    return const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 22);
  }

  static TextStyle titleMedium(){
    return const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16);
  }

}
