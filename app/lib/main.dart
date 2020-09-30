import 'package:booking/authentication/UI/Aurthscreen.dart';
import 'package:booking/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:booking/main/cubit/main_cubit.dart';
import 'package:booking/prefernce.dart';
import 'package:booking/services/settingservice.dart';
import 'package:booking/theme/appTheme.dart';
import 'package:booking/theme/bloc/apptheme_bloc.dart';
import 'package:booking/utils/bloc_deleget.dart';
import 'package:booking/services/userrepo.dart';
import 'package:booking/splashscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loaction/locationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  SharedPreferences.getInstance().then((pref) {
    SHpref.setup(pref);

    UserRepository user = UserRepository(preferences: SHpref.pref);

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(user)..add(AuthenticationStarted()),
        ),
        BlocProvider(create: (create) => AppthemeBloc()..add(ThemeLoading())),
        BlocProvider(
          create: (context) => MainCubit(),
        ),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppthemeBloc, AppthemeState>(
      cubit: BlocProvider.of<AppthemeBloc>(context),
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: state.theme,
          darkTheme: AppTheme.dark,
          theme: AppTheme.light,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            cubit: BlocProvider.of<AuthenticationBloc>(context),
            builder: (context, state) {
              if (state is AuthenticationInitial) {
                return SplashScreen();
              } else if (state is AuthenticationSuccess) {
                return LocationScreen();
              } else if (state is Authenticationfail) {
                return AuthScreen();
              }
              return SplashScreen();
            },
          ),
        );
      },
    );
  }
}
