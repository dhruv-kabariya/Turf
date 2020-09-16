import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/login/bloc/login_bloc.dart';
import 'package:booking/services/userrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({@required this.authbloc, @required this.user, Key key})
      : assert(authbloc != null),
        assert(user != null),
        super(key: key);

  AuthenticationBloc authbloc;
  UserRepository user;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userId;
  TextEditingController _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _size = 18;
  LoginBloc bloc;

  @override
  void initState() {
    bloc = LoginBloc(user: widget.user, authbloc: widget.authbloc);
    _userId = TextEditingController();
    _userId.addListener(_onEmailChange);
    _password = TextEditingController();
    _password.addListener(_onPasswordChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boxheight = MediaQuery.of(context).size.height / 100;
    double boxwidth = MediaQuery.of(context).size.width / 100;

    return BlocBuilder<LoginBloc, LoginState>(
      cubit: bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              SizedBox(
                height: boxheight * 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: boxwidth * 10),
                height: boxheight * 25,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/playing.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: boxheight * 5,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.only(
                          left: boxheight * 5,
                          right: boxheight * 5,
                          top: boxheight * 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (_) {
                            return !state.isEmailValid
                                ? "Enter Valid Email"
                                : null;
                          },
                          controller: _userId,
                          decoration: InputDecoration(
                              // prefixIcon: Icon(Icons.email),
                              contentPadding:
                                  EdgeInsets.only(left: boxwidth * 5),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white70),
                              hintText: "User Name or Email"),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.only(
                          left: boxheight * 5,
                          right: boxheight * 5,
                          top: boxheight * 2),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          // textAlign: TextAlign.left,
                          controller: _password,
                          obscureText: true,
                          validator: (_) {
                            return !state.isPasswordVlid
                                ? "Invalid Password"
                                : null;
                          },
                          decoration: InputDecoration(

                              // prefixIcon: Icon(Icons.lock),
                              contentPadding:
                                  EdgeInsets.only(left: boxwidth * 5),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              hintText: "Password"),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(
                        left: boxheight * 5,
                        right: boxheight * 5,
                        top: boxheight * 2,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        onTap: _userId.text.isNotEmpty &&
                                _password.text.isNotEmpty &&
                                !state.isSubmitting
                            ? () {
                                bloc.add(LoginWithCredentials(
                                    email: _userId.text,
                                    password: _password.text));
                              }
                            : null,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: _userId.text.isNotEmpty &&
                                      _password.text.isNotEmpty &&
                                      !state.isSubmitting
                                  ? Color(0xfffc3147)
                                  : Color(0x80fc3147),
                              borderRadius: BorderRadius.circular(5)),
                          child: state.isSubmitting
                              ? CircularProgressIndicator(
                                  strokeWidth: 2,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: boxwidth * 10, vertical: boxheight * 3),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.white70,
                              thickness: 2,
                              // endIndent: 10,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white70,
                              thickness: 2,
                              // indent: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: boxwidth * 10,
                      ),
                      child: InkWell(
                        onTap: !state.isSubmitting
                            ? () {
                                bloc.add(LoginWithGoogle());
                              }
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: boxwidth * 10,
                              height: boxwidth * 10,
                              child: Image.asset(
                                "assets/google.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: boxwidth * 2,
                            ),
                            Text(
                              "SignIn With Google",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: boxheight * _size,
              ),
              Divider(
                height: boxheight * 2,
                thickness: 0.5,
                color: Colors.white70,
              ),
              Container(
                  height: boxheight * 5,
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 14, color: Colors.white60),
                      ),
                      SizedBox(
                        width: boxwidth * 1,
                      ),
                      InkWell(
                        onTap: () {
                          widget.authbloc.add(AuthenticationSignUp());
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _password.dispose();
    _userId.dispose();

    super.dispose();
  }

  void _onEmailChange() {
    bloc.add(LoginEmailChanged(email: _userId.text));
  }

  void _onPasswordChange() {
    bloc.add(LoginPasswordChange(password: _password.text));
  }
}
