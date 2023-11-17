import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void show(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return widget;
      },
    );
  }

  static void showFullscreen(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext builderContext) {
        return SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: widget)),
        );
      },
    );
  }
}
