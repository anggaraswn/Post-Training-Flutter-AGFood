import 'package:agfood/home.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controllerEmail = TextEditingController();
  var controllerUsername = TextEditingController();
  var controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff9ED2C6),
            Color(0xff54BAB9),
          ],
        )),
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            const Text(
              "Log In",
              style: TextStyle(
                  color: Color(0xFFF7ECDE),
                  fontFamily: 'OpenSans',
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/Logo.png', width: 300, height: 300),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: controllerUsername,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    iconColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your username'),
                validator: (username) {
                  if (username!.isEmpty) {
                    return 'Username cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: controllerEmail,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    iconColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email'),
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!EmailValidator.validate(email)) {
                    return 'Enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                  controller: controllerPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Password',
                      hintText: 'Enter your password'),
                  validator: ((password) {
                    if (password!.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>]).{5,}$')
                        .hasMatch(password)) {
                      var validPassword = [];
                      if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])')
                          .hasMatch(password)) {
                        validPassword.add('Password must contains [a-z][A-Z]');
                      }
                      if (!RegExp(r'(?=.*?[0-9])').hasMatch(password)) {
                        validPassword.add(
                            'Password must have at least one digit of number');
                      }
                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                          .hasMatch(password)) {
                        validPassword
                            .add('Password must have one special character');
                      }

                      if (password.length < 5) {
                        validPassword
                            .add('Password must have at least 5 characters');
                      }

                      var errorMSG = '';
                      validPassword.forEach((element) {
                        errorMSG += element + '\n';
                      });
                      return errorMSG;
                      // 'Password must have at least 5 characters \nPassword must have at least one lower case \nPassword must have at least one upper case \nPassword must have at least one digit of number \nPassword must have one special character';
                    } else {
                      return null;
                    }
                  })),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ElevatedButton(
                style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size.fromHeight(50))),
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();

                  if (isValidForm) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return HomePage(
                          username: controllerUsername.text,
                          email: controllerEmail.text);
                    }), (route) => false);
                  }
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ]),
        ),
      )),
    ));
  }
}
