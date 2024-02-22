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
}
