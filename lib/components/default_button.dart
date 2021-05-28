import 'package:flutter/material.dart';
import 'package:kuy_futsal/constant.dart';
import 'package:kuy_futsal/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key key, this.text, this.press, this.disabled = false})
      : super(key: key);
  final String text;
  final Function press;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(40),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: disabled
              ? MaterialStateProperty.all(Color(0xFF8492A6))
              : MaterialStateProperty.all(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: BorderSide(
                    color: disabled ? Color(0xFF8492A6) : kPrimaryColor)),
          ),
        ),
        onPressed: disabled ? null : press,
        child: Text(
          text,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18), color: Colors.white),
        ),
      ),
    );
  }
}
