import 'package:booking/loaction/bloc/location_bloc.dart';
import 'package:booking/locationSelect/bloc/locationselect_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationSelectScreen extends StatelessWidget {
  LocationSelectScreen({@required this.locationBloc, Key key})
      : super(key: key);
  final LocationBloc locationBloc;
  @override
  Widget build(BuildContext context) {
    final LocationselectBloc bloc =
        LocationselectBloc(service: locationBloc.service, bloc: locationBloc);

    TextEditingController _location = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
              child: TextFormField(
                onChanged: (location) {
                  if (location.isEmpty) {
                    bloc.add(LocationNoQuery());
                  } else {
                    bloc.add(LocationQuery(query: location));
                  }
                },
                style: Theme.of(context).textTheme.subtitle1,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Location",
                    hintStyle: Theme.of(context).textTheme.headline5),
                controller: _location,
              ),
            ),
            Expanded(
              child: BlocBuilder<LocationselectBloc, LocationselectState>(
                cubit: bloc,
                builder: (context, state) {
                  if (state is LocationNoQuery) {
                    return Container(
                      child: Center(
                        child: Text("Select Location"),
                      ),
                    );
                  } else if (state is LocationListLoading) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is LocationListLoaded) {
                    if (state.list.isEmpty) {
                      return Container(
                        child: Center(
                          child: Text("No Location Found"),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            bloc.add(
                              LocationSSelect(location: state.list[index]),
                            );
                            if (locationBloc.state is LocationSelected) {
                              Navigator.of(context).pop();
                            }
                          },
                          title: Text(state.list[index]),
                        );
                      },
                    );
                  }
                  return Container(
                    child: Center(
                      child: Text("Select Location"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
