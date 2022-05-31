import 'package:demo_cricket_scorecard/constants/app_constants.dart';
import 'package:demo_cricket_scorecard/data/drift_database.dart';
import 'package:demo_cricket_scorecard/models/create_match_model.dart';
import 'package:demo_cricket_scorecard/widgets/dropdownbutton.dart';
import 'package:demo_cricket_scorecard/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../widgets/text_field.dart';

class CreateMatch extends StatefulWidget {
  const CreateMatch({Key key}) : super(key: key);

  @override
  State<CreateMatch> createState() => _CreateMatchState();
}

class _CreateMatchState extends State<CreateMatch> {
  int teamA;
  int teamB;
  String dropDownCityValue;
  var city = ["Mumbai", "Delhi", "Surat", "kolkata", "Bangalore"];
  final TextEditingController _over = TextEditingController();
  final TextEditingController _matchdate = TextEditingController();
  final CreateMatchModel _createMatch = CreateMatchModel();
  DateTime _selecteddate = DateTime.now();

  Future _selectMatchDateMethod(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.day,
        initialDate: _selecteddate,
        firstDate: _selecteddate,
        lastDate: DateTime(2100));
    if (picked != null) {
      _selecteddate = picked;
      _matchdate.text =
          DateFormat('MM/dd/yyyy').format(_selecteddate) ?? DateTime.now();
      _createMatch.createdAt = _selecteddate.toString();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            FutureBuilder<List<Team>>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropDownButtonWidget(
                    hinttext: "Team A",
                    value: teamA,
                    items: snapshot.data.where((element) => element.id != _createMatch.rivalTeamId)
                        .map((team) {
                      return DropdownMenuItem(
                          value: team.id, child: Text(team.teamName));
                    }).toList(),
                    callback: (newValue) {
                      setState(() {
                        _createMatch.teamId = newValue;
                        _createMatch.teamA = snapshot.data.where((element) => element.id == newValue).first.teamName;
                        teamA = newValue;
                      });
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
              future: kAppDatabase.teamDao.allTeamName,
            ),
            FutureBuilder<List<Team>>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropDownButtonWidget(
                    hinttext: "Team B",
                    value: teamB,
                    items: snapshot.data
                        .where((element) => element.id != _createMatch.teamId)
                        .map((team) {
                      return DropdownMenuItem(
                          value: team.id, child: Text(team.teamName));
                    }).toList(),
                    callback: (newValue) {
                      setState(() {
                        _createMatch.rivalTeamId = newValue;
                        _createMatch.teamB = snapshot.data.where((element) => element.id == newValue).first.teamName;
                        teamB = newValue;
                      });
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
              future: kAppDatabase.teamDao.allTeamName,
            ),
            DropDownButtonWidget(
              hinttext: "city",
              value: dropDownCityValue,
              items: city.map((eCity) {
                return DropdownMenuItem(value: eCity, child: Text(eCity));
              }).toList(),
              callback: (newValue) {
                setState(() {
                  dropDownCityValue = newValue;
                  _createMatch.place = dropDownCityValue;
                });
              },
            ),
            Input(
              keyboardType: TextInputType.number,
              controller: _over,
              textInputAction: TextInputAction.done,
              inputDecoration:
                  const InputDecoration(labelText: 'Enter Match Over'),
              onChanged: (v) => _createMatch.overs = int.parse(v),
            ),
            Input(
              readonly: true,
              controller: _matchdate,
              inputDecoration:
                  const InputDecoration(labelText: 'Select Match Date'),
              onTap: () {
                _selectMatchDateMethod(context);
              },
            ),
            SignInButton(
              text: 'Add Match',
              width: 0.95.sw,
              callback: _addMatch,
            )
          ],
        ),
      ]),
    );
  }

  void _addMatch() {
    // CreateMatchModel(teamA: teamA,teamB: teamB,place: dropDownCityValue,over: int.parse(_over.text),date:_matchdate.text);
    if(_createMatch.teamId == null)
      {
        Fluttertoast.showToast(msg: 'Select Team A');
        return;
      }
    if(_createMatch.rivalTeamId == null)
    {
      Fluttertoast.showToast(msg: 'Select Team B');
      return;
    }
    if(_createMatch.place == null)
    {
      Fluttertoast.showToast(msg: 'Select Place Of Match');
      return;
    }
    if(_createMatch.createdAt == null)
    {
      Fluttertoast.showToast(msg: 'Select Team A');
      return;
    }
    kAppDatabase.matchDao.insertMatch(_createMatch);

     teamB == null;
     dropDownCityValue == null;
    _over.clear();
    _matchdate.clear();
    setState((){

    });
  }
}
