class AddScoreModel {
  int id;
  int playerId;
  int teamId;
  int matchId;
  int run;
  int ball;
  bool isOut;
  String createdAt;

  AddScoreModel(
      {this.id,
        this.playerId,
        this.teamId,
        this.matchId,
        this.run,
        this.ball,
        this.isOut,
        this.createdAt});

  AddScoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['playerId'];
    teamId = json['teamId'];
    matchId = json['matchId'];
    run = json['run'];
    ball = json['ball'];
    isOut = json['isOut'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['playerId'] = playerId;
    data['teamId'] = teamId;
    data['matchId'] = matchId;
    data['run'] = run;
    data['ball'] = ball;
    data['isOut'] = isOut;
    data['createdAt'] = createdAt;
    return data;
  }
}