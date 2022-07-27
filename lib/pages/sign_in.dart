import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_d_yoga/model/model.dart';
import 'package:three_d_yoga/pages/sign_up.dart';
import 'package:three_d_yoga/utils/colors.dart';
import 'package:three_d_yoga/utils/dimensions.dart';
import 'package:three_d_yoga/widgets/text_elements/big_text.dart';
import 'package:three_d_yoga/widgets/sign_button.dart';

import '../widgets/appbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  LoginUser _loginUser = new LoginUser("", "");
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final loginField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (inValue){
        if (inValue!.length == 0) {
          return "Введите логин";
        }
        return null;
      },
      decoration: const InputDecoration(
          hintText: "логин/номер телефона"
      ),
      onSaved: (value) {
        this._loginUser.login = value!;
      },
    );

    final passwordField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
          hintText: "****"
      ),
      validator: (value) {
        if (value!.length < 5) {
          return "Пароль должен быть длиннее 5 символов!";
        }
        return null;
      },
    );

    final signInButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5
      ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

          }
        },
        child: Text("Войти")
    );

    final redirectToSignUpButton = TextButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUp()),
          );
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20)
            )),
        child: Text("Зарегистрироваться")
    );

    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BigText(text: "Вход"),
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
                      loginField,
                      passwordField,
                      SizedBox(height: Dimensions.height20,),
                      signInButton,
                      SizedBox(height: Dimensions.height20,),
                      Text("Еще не зарегистрирован?"),
                      redirectToSignUpButton,
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
}
