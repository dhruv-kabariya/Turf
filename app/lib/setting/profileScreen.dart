import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/model/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double boxHeight = MediaQuery.of(context).size.height / 100;
    final double boxWidth = MediaQuery.of(context).size.width / 100;

    final User user = BlocProvider.of<AuthenticationBloc>(context)
        .userRepository
        .getUserObj();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: boxHeight * 100,
        width: boxWidth * 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://www.whoa.in/201604-Whoa/-cristiano-ronaldo-mobile-wallpapers-footballers-hd-images.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop)),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: boxWidth * 20,
                  backgroundImage: NetworkImage(
                    user.photoUrl,
                  ),
                ),
              ),
              SizedBox(
                height: boxHeight * 7,
              ),
              Container(
                width: boxWidth * 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          user.name,
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.mail),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          user.mail,
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
