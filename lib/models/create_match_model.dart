class CreateMatchModel {
  int id;
  int teamId;
  int rivalTeamId;
  String teamA;
  String teamB;
  String place;
  int overs;
  String createdAt;

  CreateMatchModel(
      {this.id,
      this.teamId,
      this.rivalTeamId,
      this.teamA,
      this.teamB,
      this.place,
      this.overs,
      this.createdAt});

  CreateMatchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['teamId'];
    rivalTeamId = json['rivalTeamId'];
    teamA = json['teamA'];
    teamB = json['teamB'];
    place = json['place'];
    overs = json['overs'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamId'] = teamId;
    data['rivalTeamId'] = rivalTeamId;
    data['teamA'] = teamA;
    data['teamB'] = teamB;
    data['place'] = place;
    data['overs'] = overs;
    data['createdAt'] = DateTime.parse(createdAt).millisecondsSinceEpoch;
    return data;
  }
}

