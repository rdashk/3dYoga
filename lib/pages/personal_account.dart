import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:three_d_yoga/model/model.dart';
import 'package:three_d_yoga/pages/sign_in.dart';

import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/text_elements/big_text.dart';

class PersonalAccount extends StatefulWidget {
  const PersonalAccount({Key? key}) : super(key: key);

  @override
  State<PersonalAccount> createState() => _PersonalAccountState();
}

class _PersonalAccountState extends State<PersonalAccount> {
  User currentUser = User(id: 1, name: "Darya", email: "rr", password: "*****", phone: "89123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                BigText(text: "Страница пользователя"),
                Text(this.currentUser.name),
                Text(this.currentUser.email),
                Text(this.currentUser.password),
                Text(this.currentUser.phone),
                TextButton(
                    onPressed: () {
                      logout();
                    },
                    child: Icon(Icons.exit_to_app)
                )
              ],
            ),
          )
      ),
    );
  }

  logout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
      );
  }
}

