import 'package:flutter/material.dart';

void unFocusTextFieldsWhenClickOutSide(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }