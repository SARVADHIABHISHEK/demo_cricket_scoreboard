import 'package:demo_cricket_scorecard/data/drift_database.dart';
import 'package:demo_cricket_scorecard/models/player_model.dart';

class TeamModel {
  int id;
  String teamName;
  List<PlayerModel> players;
  String createdAt;

  int get playerCount => players.length;

  TeamModel({this.id, this.teamName, this.players, this.createdAt});

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['teamName'];
    if (json['players'] != null) {
      players = <PlayerModel>[];
      json['players'].forEach((v) {
        players.add(PlayerModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
  }

  TeamModel.fromEntity(Team team, {this.players}) {
    id = team.id;
    teamName = team.teamName;
    createdAt = team.createdAt.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamName'] = teamName;
    if (players != null) {
      data['players'] = players.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}
