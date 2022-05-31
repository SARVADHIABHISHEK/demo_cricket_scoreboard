class PlayerModel {
  int id;
  int teamId;
  String playerName;
  int age;
  double height;
  String createdAt;

  PlayerModel(
      {this.id,
        this.teamId,
        this.playerName,
        this.age,
        this.height,
        this.createdAt});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['teamId'];
    playerName = json['playerName'];
    age = json['age'];
    height = json['height'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamId'] = teamId;
    data['playerName'] = playerName;
    data['age'] = age;
    data['height'] = height;
    data['createdAt'] = createdAt;
    return data;
  }
}