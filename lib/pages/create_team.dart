import 'dart:ffi';

import 'package:demo_cricket_scorecard/constants/app_constants.dart';
import 'package:demo_cricket_scorecard/models/player_model.dart';
import 'package:demo_cricket_scorecard/models/team_model.dart';
import 'package:demo_cricket_scorecard/widgets/text_button.dart';
import 'package:demo_cricket_scorecard/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({Key key}) : super(key: key);

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  final _columns = ['Player Name', 'Age', 'Height'];

  final TeamModel _teamModel = TeamModel(players: []);

  final TextEditingController _teamName = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Form(
                  key: fromKey,
                  child: Input(
                    controller: _teamName,
                    onChanged: (v) => _teamModel.teamName = v,
                    inputDecoration:
                        const InputDecoration(labelText: 'Team Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter TeamName';
                      }
                      return null;
                    },
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: _columns.map((column) {
                      return DataColumn(label: Text(column));
                    }).toList(),
                    rows: _teamModel.players.map((player) {
                      return DataRow(
                        cells: [
                          DataCell(Text(player.playerName)),
                          DataCell(Text(player.age.toString())),
                          DataCell(Text(player.height.toString())),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SignInButton(
            text: "Add Team",
            width: 0.95.sw,
            callback: () {
              if (fromKey.currentState.validate()) {}
              if (_teamName.text.isNotEmpty) {
                if (_teamModel.playerCount == 11) {
                  kAppDatabase.teamDao.insertTeam(_teamModel);
                  kSharedPreferences.setBool('teamAdded', true);
                } else {
                  Fluttertoast.showToast(msg: 'Eleven Player Required');
                }
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.w),
            child: SizedBox(
              width: 0.82.sw,
              height: 40.h,
              child: OutlinedButton(
                onPressed: _addPlayer,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: const BorderSide(width: 2.0, color: Colors.blue),
                ),
                child: const Text(
                  'Add Player',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///
  void _addPlayer() async {
    if (_teamModel.playerCount >= 11) {
      Fluttertoast.showToast(msg: ' only 11 Player Required');
      return;
    }

    final player = await showCupertinoDialog<PlayerModel>(
      context: context,
      builder: (_) => _PlayerAddDialog(),
      barrierDismissible: true,
    );

    if (player != null) {
      _teamModel.players.add(PlayerModel.fromJson(player.toJson()));
      setState(() {});
    }
  }
}

class _PlayerAddDialog extends StatelessWidget {
  _PlayerAddDialog({Key key}) : super(key: key);
  static final TextEditingController _playerName = TextEditingController();
  static final TextEditingController _age = TextEditingController();
  static final TextEditingController _height = TextEditingController();

  final playerKey = GlobalKey<FormState>();
  final playerAgeKey = GlobalKey<FormState>();
  final playerHeightKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: playerKey,
            child: Input(
              inputDecoration: const InputDecoration(labelText: "Player Name"),
              controller: _playerName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Player Name Required';
                }
                return null;
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Form(
                  key: playerAgeKey,
                  child: Input(
                    keyboardType: TextInputType.number,
                    inputDecoration: const InputDecoration(labelText: "Age"),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: _age,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter age';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: playerHeightKey,
                  child: Input(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputDecoration: const InputDecoration(labelText: "Height"),
                    controller: _height,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter Height';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => _addPlayer(context),
          child: const Text("ADD"),
        )
      ],
    );
  }

  void _addPlayer(BuildContext context) {

    if (playerKey.currentState.validate()) {

    }
    if (playerAgeKey.currentState.validate()) {

    }
    if (playerHeightKey.currentState.validate()) {

    }

    if (_playerName.text.isNotEmpty &&
        _age.text.isNotEmpty &&
        _height.text.isNotEmpty) {
      Navigator.of(context).pop(PlayerModel(
        playerName: _playerName.text,
        age: int.tryParse(_age.text),
        height: double.tryParse(_height.text),
      ));
      _playerName.clear();
      _age.clear();
      _height.clear();
    }
  }
}
