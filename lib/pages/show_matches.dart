import 'package:demo_cricket_scorecard/data/drift_database.dart';
import 'package:demo_cricket_scorecard/pages/add_score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

class ShowMatches extends StatefulWidget {
  const ShowMatches({Key key}) : super(key: key);

  @override
  State<ShowMatches> createState() => _ShowMatchesState();
}

class _ShowMatchesState extends State<ShowMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kSharedPreferences.getBool('teamAdded') == true ? ListView(
        children: [
          Column(children: [
            FutureBuilder<List<Matche>>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data[index];
                      return  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => AddScore(teamAId: item.teamId,teamBId: item.rivalTeamId,teamAName: item.teamA,teamBName:item.teamB,matchId: item.id,))),
                          //onLongPress: () => Navigator.push(context, CupertinoPageRoute(builder: (_) =>(teamAId: item.teamId,teamBId: item.rivalTeamId,teamAName: item.teamA,teamBName:item.teamB,matchId: item.id,))),
                          child: Card(
                            shadowColor: Colors.red,
                            child: ExpansionTile(
                              title: Text("${item.teamA} vs ${item.teamB}"),
                              children: [
                                ListTile(
                                  title: Text(item.place),
                                  subtitle: Text("overs-${item.overs}",style: const TextStyle(color:Colors.black),),
                                  trailing: Text(DateFormat('MM-dd-yyyy').format(item.createdAt)),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },);
                } else {
                  return const SizedBox();
                }
              },
              future: kAppDatabase.matchDao.watchMatches(),
            ),
          ]),
        ],
      ) : const  Center(child: Text('Data Not Found'),),
    );
  }
}
