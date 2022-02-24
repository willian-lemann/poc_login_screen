import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poc_login_screen/src/controllers/loginFormController.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var loginFormController = LoginFormController();

  changePasswordVisibility() {
    setState(() {
      loginFormController.showPassword = !loginFormController.showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Colors.red),
        child: Stack(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(color: Colors.red),
              child: Image(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.6,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(66),
                      topRight: Radius.circular(66),
                    )),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.9,
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(),
                            ),
                            labelText: "Email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email must not be empty";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: size.width * 0.9,
                        child: TextFormField(
                            obscureText: loginFormController.showPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(),
                              ),
                              labelText: "Password",
                              suffixIcon: IconButton(
                                  onPressed: () => changePasswordVisibility(),
                                  icon: Icon(
                                    loginFormController.showPassword
                                        ? Icons.remove_red_eye
                                        : Icons.visibility_off,
                                  )),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password must not be empty";
                              }

                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "Forgot password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(180, 180, 180, 1),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      Container(
                        width: size.width * 0.9,
                        height: 48,
                        margin: EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: loginFormController.isEmptyFields
                                ? Color.fromRGBO(226, 226, 226, 1)
                                : Color.fromRGBO(106, 48, 147, 1),
                          ),
                          onPressed: () {
                            var isValid = _formKey.currentState!.validate();

                            if (isValid) {
                              setState(() {
                                loginFormController.isEmptyFields = false;
                              });

                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: loginFormController.isEmptyFields
                                  ? Color.fromRGBO(106, 48, 147, 1)
                                  : Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                          ),
                          Text("or"),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * 0.9,
                        height: 48,
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(217, 48, 37, 1),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.g_mobiledata),
                              Text("Continue with Google"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Color.fromRGBO(180, 180, 180, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Register!",
                              style: TextStyle(
                                color: Color.fromRGBO(106, 48, 147, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
