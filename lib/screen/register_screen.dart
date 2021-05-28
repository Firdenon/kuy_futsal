import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuy_futsal/components/default_button.dart';
import 'package:kuy_futsal/constant.dart';
import 'package:kuy_futsal/size_config.dart';

enum RegisterType { Consumer, Owner }

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              color: Colors.black,
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(40),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(12),
                    ),
                    child: Text(
                      "DAFTAR",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: getProportionateScreenWidth(20)),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  RegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();
  RegisterType _registerType;
  String _gender;
  bool _termsCondition = false;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => node.nextFocus(),
            validator: (value) {
              if (value.isEmpty || value == null) {
                return 'isi nama lengkap';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(labelText: "Nama Lengkap"),
          ),
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
          DropdownButtonFormField(
            items: <String>["Laki-laki", "Perempuan"].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: _gender,
            decoration: InputDecoration(
              labelText: "Jenis Kelamin",
            ),
            onChanged: (_) {},
          ),
          TextFormField(
            onEditingComplete: () => node.nextFocus(),
            validator: (value) {
              if (value.isEmpty || value == null) {
                return 'isi alamat';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Alamat",
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            onEditingComplete: () => node.nextFocus(),
            validator: (value) {
              if (value.isEmpty || value == null) {
                return 'isi nomor handphone';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                prefix: Text(
                  "(+62)  ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                labelText: "Nomor Handphone",
                hintText: "000000"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<RegisterType>(
                value: RegisterType.Consumer,
                groupValue: _registerType,
                onChanged: (RegisterType value) {
                  setState(() {
                    _registerType = value;
                  });
                },
              ),
              Text("Consumer"),
              SizedBox(
                width: getProportionateScreenWidth(30),
              ),
              Radio<RegisterType>(
                value: RegisterType.Owner,
                groupValue: _registerType,
                onChanged: (RegisterType value) {
                  setState(() {
                    _registerType = value;
                  });
                },
              ),
              Text("Owner"),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(41),
          ),
          CheckboxListTile(
              contentPadding: EdgeInsets.all(0),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("Saya menyetujui ketentuan E-Futsal"),
              value: _termsCondition,
              onChanged: (bool value) {
                setState(() {
                  _termsCondition = value;
                });
              }),
          DefaultButton(
            text: "SELANJUTNYA",
            disabled: !_termsCondition,
            press: () {
              if (_formkey.currentState.validate()) {
                log("register clicked");
              }
            },
          )
        ],
      ),
    );
  }
}
