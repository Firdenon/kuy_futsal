import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuy_futsal/components/default_button.dart';
import 'package:kuy_futsal/constant.dart';
import 'package:kuy_futsal/screen/register_screen.dart';
import 'package:kuy_futsal/size_config.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(40),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/logo.png'),
                      width: getProportionateScreenWidth(120),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    Text(
                      'Sewa lapangan futsal kini mudah.\n Temukan, Booking, Kuy futsal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF47525E),
                        fontSize: getProportionateScreenWidth(18),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    LoginForm(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Tidak memiliki akun?"),
                        TextButton(
                            onPressed: () => Navigator.pushNamed(
                                context, RegisterScreen.routeName),
                            child: Text(
                              'Daftar Sekarang',
                              style: TextStyle(color: kPrimaryColor),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => node.nextFocus(),
            validator: (value) {
              if (value.isEmpty || value == null) {
                return 'isi email';
              } else {
                return null;
              }
            },
            decoration:
                InputDecoration(labelText: "Email", hintText: "xxxx@mail.com"),
          ),
          TextFormField(
            obscureText: true,
            onEditingComplete: () => node.unfocus(),
            validator: (value) {
              if (value.isEmpty || value == null) {
                return 'isi password';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(41),
          ),
          DefaultButton(
            text: "MASUK",
            press: () {
              if (_formKey.currentState.validate()) {
                log("login clicked");
              }
            },
          )
        ],
      ),
    );
  }
}
