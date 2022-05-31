import 'package:demo_cricket_scorecard/data/drift_database.dart';
import 'package:demo_cricket_scorecard/models/AddScoremodel.dart';
import 'package:demo_cricket_scorecard/widgets/text_button.dart';
import 'package:demo_cricket_scorecard/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_constants.dart';
import '../widgets/dropdownbutton.dart';

class AddScore extends StatefulWidget {
  final int teamAId;
  final String teamAName;
  final String teamBName;
  final int teamBId;
  final int matchId;

  const AddScore({Key key, this.teamAId, this.teamBId, this.teamAName, this.teamBName,this.matchId}) : super(key: key);

  @override
  _AddScoreState createState() => _AddScoreState();
}

class _AddScoreState extends State<AddScore> with TickerProviderStateMixin {
  final TextEditingController _teamARun = TextEditingController();
  final TextEditingController _teamABall = TextEditingController();
  final TextEditingController _teamBRun = TextEditingController();
  final TextEditingController _teamBBall = TextEditingController();

  final  AddScoreModel _addScoreData = AddScoreModel();


  int teamAPlayer;
  int teamBPlayer;

  bool _checkbox = false;
  bool _teamBCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _tabSection(),
      ),
    );
  }

  Widget _tabSection() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Colors.blue),
              ),
              child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: widget.teamAName,
                    ),
                    Tab(
                      text: widget.teamBName,
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.teamAName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
                  ),
                  FutureBuilder<List<Player>>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropDownButtonWidget(
                          hinttext: "Team A Players",
                          value: teamAPlayer,
                          items: snapshot.data
                              .where(
                                  (element) => element.teamId == widget.teamAId)
                              .map((player) {
                            return DropdownMenuItem(
                                value: player.id, child: Text(player.playerName));
                          }).toList(),
                          callback: (newValue) {
                            setState(() {
                              teamAPlayer = newValue;
                              _addScoreData.playerId = newValue;
                              _addScoreData.teamId = snapshot.data.where((element) => element.id == newValue).first.teamId;
                              _addScoreData.matchId = widget.matchId;
                            });
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    future: kAppDatabase.teamDao.allPlayerName,
                  ),
                  Input(
                    controller: _teamARun,
                    inputDecoration: const InputDecoration(
                      hintText: 'Enter Run',
                    ),
                    onChanged: (v) => _addScoreData.run = int.parse(v),
                  ),
                  Input(
                    controller: _teamABall,
                    inputDecoration: const InputDecoration(
                      hintText: 'Enter Ball',
                    ),
                    textInputAction: TextInputAction.done,
                    onChanged: (v) => _addScoreData.ball = int.parse(v),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 45.h,
                    width: 0.93.sw,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.red,
                            value: _checkbox,
                            onChanged: (bool newValue) {
                              setState(() {
                                _checkbox = newValue;
                                _addScoreData.isOut = newValue;
                              });
                            }),
                        const Text('Is Out Or Not?'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SignInButton(
                    width: 0.90.sw,
                    text: 'Add For Team A',
                    callback: (){
                      kAppDatabase.scoreDao.insertPlayer(_addScoreData);
                    },
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.teamBName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
                  ),
                  FutureBuilder<List<Player>>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropDownButtonWidget(
                          hinttext: "Team B Players",
                          value: teamBPlayer,
                          items: snapshot.data
                              .where(
                                  (element) => element.teamId == widget.teamBId)
                              .map((team) {
                            return DropdownMenuItem(
                                value: team.id, child: Text(team.playerName));
                          }).toList(),
                          callback: (newValue) {
                            setState(() {
                              teamBPlayer = newValue;
                              _addScoreData.playerId = newValue;
                              _addScoreData.teamId = snapshot.data.where((element) => element.id == newValue).first.teamId;
                              _addScoreData.matchId = widget.matchId;
                            });
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    future: kAppDatabase.teamDao.allPlayerName,
                  ),
                  Input(
                    controller: _teamBRun,
                    inputDecoration: const InputDecoration(
                      hintText: 'Enter Run',
                    ),
                    onChanged: (v) => _addScoreData.run = int.parse(v),
                  ),
                  Input(
                    controller: _teamBBall,
                    inputDecoration: const InputDecoration(
                      hintText: 'Enter Ball',
                    ),
                    textInputAction: TextInputAction.done,
                    onChanged: (v) => _addScoreData.ball = int.parse(v),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 45.h,
                    width: 0.93.sw,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.red,
                            value: _teamBCheckBox,
                            onChanged: (bool newValue) {
                              setState(() {
                                _teamBCheckBox = newValue;
                                _addScoreData.isOut = newValue;
                              });
                            }),
                        const Text('Is Out Or Not?'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SignInButton(
                    width: 0.90.sw,
                    text: 'Add For Team B',
                    callback: (){
                      kAppDatabase.scoreDao.insertPlayer(_addScoreData);
                    },
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
