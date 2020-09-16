import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/services/userrepo.dart';
import 'package:booking/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({@required this.authbloc, @required this.userrepo})
      : assert(userrepo != null),
        assert(authbloc != null);

  AuthenticationBloc authbloc;
  UserRepository userrepo;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _email;
  TextEditingController _pass;
  TextEditingController _conpass;
  SignupBloc bloc;

  @override
  void initState() {
    _email = TextEditingController();
    _pass = TextEditingController();
    _conpass = TextEditingController();
    bloc = SignupBloc(authbloc: widget.authbloc, userrepo: widget.userrepo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double boxheight = MediaQuery.of(context).size.height / 100;
    double boxwidth = MediaQuery.of(context).size.width / 100;

    return BlocBuilder<SignupBloc, SignupState>(
      cubit: bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                          controller: _email,
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
                          controller: _pass,
                          obscureText: true,
                          validator: (_) {
                            return !state.isPasswordValid
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
                        onTap: _email.text.isNotEmpty &&
                                _pass.text.isNotEmpty &&
                                !state.isSubmitting
                            ? () {
                                bloc.add(SignupWithCredentials(
                                    email: _email.text, password: _pass.text));
                              }
                            : null,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: _email.text.isNotEmpty &&
                                      _pass.text.isNotEmpty &&
                                      !state.isSubmitting
                                  ? Color(0xfffc3147)
                                  : Color(0x80fc3147),
                              borderRadius: BorderRadius.circular(5)),
                          child: state == SignupState.loading()
                              ? CircularProgressIndicator()
                              : Text(
                                  "SignUp",
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
                        onTap: () {
                          bloc.add(SignupwithGoogle());
                        },
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
                              "SignUp With Google",
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
                height: boxheight * 18,
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
                        "Alredy have an account!",
                        style: TextStyle(fontSize: 14, color: Colors.white60),
                      ),
                      SizedBox(
                        width: boxwidth * 1,
                      ),
                      InkWell(
                        onTap: () {
                          widget.authbloc.add(AuthenticationLogin());
                        },
                        child: Text(
                          "Login",
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
}
