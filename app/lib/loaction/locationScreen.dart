import 'package:booking/loaction/bloc/location_bloc.dart';
import 'package:booking/locationSelect/UI/screen.dart';
import 'package:booking/main/mainScreen.dart';
import 'package:booking/prefernce.dart';
import 'package:booking/services/locationrepo.dart';
import 'package:booking/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key key}) : super(key: key);
  static final LocationService service =
      LocationService(preferences: SHpref.pref);
  final LocationBloc bloc = LocationBloc(service: service)
    ..add(LocationCheck());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<LocationBloc, LocationState>(
        cubit: bloc,
        builder: (context, state) {
          if (state is LocationInitial) {
            return SplashScreen();
          } else if (state is LocationSelected) {
            return MainScreen();
          } else if (state is LocationUnSeleted) {
            return LocationSelectScreen(
              locationBloc: bloc,
            );
          }
        },
      ),
    );
  }

  void dispose() {
    bloc.close();
  }
}
