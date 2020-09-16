import 'package:booking/loaction/bloc/location_bloc.dart';
import 'package:booking/locationSelect/UI/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocationBloc bloc = BlocProvider.of<LocationBloc>(context);
    return SliverAppBar(
      elevation: 5,
      titleSpacing: 10,
      floating: true,
      actionsIconTheme: IconThemeData(size: 18),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LocationSelectScreen(
                locationBloc: bloc,
              ),
            ),
          );
        },
        child: Container(
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 22,
              ),
              SizedBox(width: 5),
              BlocBuilder<LocationBloc, LocationState>(
                cubit: bloc,
                builder: (context, state) {
                  if (state is LocationSelected) {
                    return Text(
                      state.location,
                      style: Theme.of(context).textTheme.headline2,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
