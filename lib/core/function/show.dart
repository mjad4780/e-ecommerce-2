import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

snacPar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

snacPar2(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Column(
        children: [
          Text(text),
        ],
      ),
    ),
  );
}

show(BuildContext context, String text) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: text,
    ),
  );
}
