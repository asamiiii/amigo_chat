import 'package:amigo_chat/screens/registration/reg_view_model.dart';
import 'package:amigo_chat/theme/light.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatefulWidget {
  static String routeName = 'reg_screen';

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  RegModelView viewModel = RegModelView();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void creatAcount() async {
    if (formkey.currentState!.validate()) {
      viewModel.creatAcount(emailController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/reg_bg.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.20,
            left: MediaQuery.of(context).size.width * 0.30,
            child: Center(
                child: Text(
              'Create Account',
              style: Theme.of(context).textTheme.headline1,
            )),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                      key: formkey,
                      child: Column(
                        children: [
                          textField('Name', nameController),
                          const SizedBox(
                            height: 10,
                          ),
                          textField('Email', emailController),
                          const SizedBox(
                            height: 10,
                          ),
                          textField('Password', passwordController,
                              secureText: true),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                creatAcount();
                              },
                              child: const Text('Creat'))
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget textField(String label, TextEditingController controller,
    {bool secureText = false}) {
  return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: controller,
      obscureText: secureText,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: black),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          )));
}
