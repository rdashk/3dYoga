import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_d_yoga/model/model.dart';
import 'package:three_d_yoga/pages/sign_in.dart';
import 'package:three_d_yoga/utils/colors.dart';
import 'package:three_d_yoga/utils/dimensions.dart';
import 'package:three_d_yoga/widgets/text_elements/big_text.dart';
import 'package:three_d_yoga/widgets/sign_button.dart';

import '../widgets/appbar.dart';
import 'gender.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignUpUser _user = SignUpUser("", "", "", "", true, 0, 0, 0, 0, "", [], []);

  @override
  Widget build(BuildContext context) {

    final fioField = TextFormField(
      onSaved: (value) => {_user.name = value!},
      decoration: const InputDecoration(
        hintText: "ФИО"
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Введите ФИО";
        }
        return null;
      },
    );

    final phoneField = TextFormField(
      onSaved: (value) => {_user.phone = value!},
      decoration: const InputDecoration(
          hintText: "номер телефона"
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Введите номер телефона";
        }
        return null;
      },
    );

    final emailField = TextFormField(
      onSaved: (value) => {_user.email = value!},
      decoration: const InputDecoration(
          hintText: "email"
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Введите email";
        }
        return null;
      },
    );

    final passwordField = TextFormField(
      onSaved: (value) => {_user.password = value!},
      obscureText: true, // в виде точек
      decoration: const InputDecoration(
          hintText: "*****"
      ),
      validator: (value) {
        if (value!.length < 5) {
          return "Пароль должен быть более 4 символов!";
        }
        return null;
      },
    );

    final signUpButton = ElevatedButton(
        onPressed: () {
          _formKey.currentState!.save();
          signUpUser(this._user);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChooseGender()),
          );
        },
        child: Text("Зарегистрироваться")
    );

    final redirectToSignInButton = TextButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
        },
      child: Text("Войти"),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20)
        )),
    );

    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BigText(text: "Регистрация"),
              Container(
                padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.backColor
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      fioField,
                      phoneField,
                      emailField,
                      passwordField,
                      SizedBox(height: Dimensions.height20,),
                      signUpButton,
                      SizedBox(height: Dimensions.height20,),
                      Text("Уже есть аккаунт?"),
                      redirectToSignInButton,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signUpUser(SignUpUser signUpUser) async {
    print(signUpUser);
  }
}
