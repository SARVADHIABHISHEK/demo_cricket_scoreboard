import 'package:demo_cricket_scorecard/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../data/drift_database.dart';

class ShowTeams extends StatefulWidget {
  const ShowTeams({Key key}) : super(key: key);

  @override
  State<ShowTeams> createState() => _ShowTeamsState();
}

class _ShowTeamsState extends State<ShowTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kSharedPreferences.getBool('teamAdded') == true ?  FutureBuilder<List<Team>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data[index].teamName),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return const Center(
              child: Text("Data not found"),
            );
          }
        },
        future: kAppDatabase.teamDao.allTeamName,
      ) : const Center(child: Text('Data Not found'),),
    );
  }
}
