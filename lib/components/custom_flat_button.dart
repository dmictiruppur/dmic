import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class CustomFlatButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  const CustomFlatButton({
    Key key,
    this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 46,
        child: /*FlatButton(
        disabledTextColor: Colors.white,
        disabledColor: Get.theme.primaryColor.withAlpha(180),
        onPressed: onPressed,
        child: child,
        textColor: Colors.white,
        color: Get.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),*/
            ElevatedButton(
          style: ElevatedButton.styleFrom(
            // Foreground color
            onPrimary: Colors.white,
            // Background color
            primary: Colors.purple,
          ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
          onPressed: onPressed,
          child: child,
        ));
  }
}
