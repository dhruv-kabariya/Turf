import 'package:booking/home/dashboardCard.dart';
import 'package:booking/search/bloc/search_bloc.dart';
import 'package:booking/services/searchService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchService searchService = SearchService();
  TextEditingController controller;
  SearchBloc bloc;

  @override
  void initState() {
    controller = TextEditingController();
    bloc = SearchBloc(service: searchService)..add(NoneQuery());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              padding: EdgeInsets.only(left: 5, top: 3, bottom: 3, right: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      style: Theme.of(context).textTheme.headline5,
                      onChanged: (query) {
                        if (query.isEmpty) {
                          bloc.add(NoneQuery());
                        } else {
                          bloc.add(Query(query: query));
                        }
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Grounds",
                          hintStyle: Theme.of(context).textTheme.headline5),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                cubit: bloc,
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Image.asset(
                          "assets/search.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                  if (state is SearchLoading) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is SearchFail) {
                    return Container(
                      child: Center(
                        child: Text(state.error),
                      ),
                    );
                  }

                  if (state is SearchResult) {
                    if (state.grounds.isEmpty) {
                      return Center(
                        child: Text(
                          "No Ground Found",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: state.grounds.length,
                        itemBuilder: (context, index) {
                          return DashBoardCard(ground: state.grounds[index]);
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();

    super.dispose();
  }
}
