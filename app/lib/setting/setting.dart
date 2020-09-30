import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/main/cubit/main_cubit.dart';
import 'package:booking/model/index.dart';
import 'package:booking/setting/profileScreen.dart';
import 'package:booking/theme/bloc/apptheme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double boxHeight = MediaQuery.of(context).size.height / 100;
    final double boxWidth = MediaQuery.of(context).size.width / 100;

    final User user = BlocProvider.of<AuthenticationBloc>(context)
        .userRepository
        .getUserObj();

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: ListView(
          children: [
            //profile
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.blueGrey[900]),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            user.mail,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                    Card(
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoUrl
                            //  'https://imagevars.gulfnews.com/2019/06/10/Portugal-s-forward-Cristiano-Ronaldo_16b414d57ae_original-ratio.jpg',
                            ),
                        radius: boxWidth * 13,
                      ),
                    )
                  ],
                ),
              ),
            ),

            // booked list
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "Booked",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),

            //payment
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "Payment",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),

//notification
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "Notification",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dark Mode",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Switch(
                      value:
                          BlocProvider.of<AppthemeBloc>(context).state.theme ==
                                  ThemeMode.dark
                              ? true
                              : false,
                      onChanged: (bool theme) {
                        BlocProvider.of<AppthemeBloc>(context)
                            .add(AppThemeChage(value: theme));
                      }),
                ],
              ),
            ),

            Divider(
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
// help section

            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Help"),
              ),
            ),

            //legal terms,
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("About Us"),
              ),
            ),
            Divider(
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),

            //legal tems
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Legal Terms"),
              ),
            ),
//rating
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Rate Us"),
              ),
            ),
//send feedback
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Send Feedback"),
              ),
            ),
            //logout
            InkWell(
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLogOut());
                BlocProvider.of<MainCubit>(context).changePage(0);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Icon(Icons.logout)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
