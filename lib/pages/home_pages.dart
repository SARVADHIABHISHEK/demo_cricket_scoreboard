import 'package:demo_cricket_scorecard/pages/create_match.dart';
import 'package:demo_cricket_scorecard/pages/create_team.dart';
import 'package:demo_cricket_scorecard/pages/show_matches.dart';
import 'package:demo_cricket_scorecard/pages/show_teams.dart';
import 'package:demo_cricket_scorecard/widgets/text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cricket Scoreboard'),
          centerTitle: true,
          bottom: const TabBar(automaticIndicatorColorAdjustment: true,isScrollable: true,tabs: [
              Tab(text: 'Create Team',),
              Tab(text: 'Create Match',),
              Tab(text: 'Show Teams',),
              Tab(text: 'Show Matches',),
          ]),
        ),
        body: const TabBarView(
          children: [
           CreateTeam(),
           CreateMatch(),
           ShowTeams(),
            ShowMatches(),
          ],
        ),
      ),
    );
  }
}
