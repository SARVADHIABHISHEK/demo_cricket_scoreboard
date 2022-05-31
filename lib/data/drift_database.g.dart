// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Team extends DataClass implements Insertable<Team> {
  final int id;
  final String teamName;
  final DateTime createdAt;
  Team({@required this.id, @required this.teamName, @required this.createdAt});
  factory Team.fromData(Map<String, dynamic> data, {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Team(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      teamName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_name']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || teamName != null) {
      map['team_name'] = Variable<String>(teamName);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TeamsCompanion toCompanion(bool nullToAbsent) {
    return TeamsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      teamName: teamName == null && nullToAbsent
          ? const Value.absent()
          : Value(teamName),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Team.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Team(
      id: serializer.fromJson<int>(json['id']),
      teamName: serializer.fromJson<String>(json['teamName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamName': serializer.toJson<String>(teamName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Team copyWith({int id, String teamName, DateTime createdAt}) => Team(
        id: id ?? this.id,
        teamName: teamName ?? this.teamName,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Team(')
          ..write('id: $id, ')
          ..write('teamName: $teamName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, teamName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Team &&
          other.id == this.id &&
          other.teamName == this.teamName &&
          other.createdAt == this.createdAt);
}

class TeamsCompanion extends UpdateCompanion<Team> {
  final Value<int> id;
  final Value<String> teamName;
  final Value<DateTime> createdAt;
  const TeamsCompanion({
    this.id = const Value.absent(),
    this.teamName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TeamsCompanion.insert({
    this.id = const Value.absent(),
    @required String teamName,
    this.createdAt = const Value.absent(),
  }) : teamName = Value(teamName);
  static Insertable<Team> custom({
    Expression<int> id,
    Expression<String> teamName,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamName != null) 'team_name': teamName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TeamsCompanion copyWith(
      {Value<int> id, Value<String> teamName, Value<DateTime> createdAt}) {
    return TeamsCompanion(
      id: id ?? this.id,
      teamName: teamName ?? this.teamName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamName.present) {
      map['team_name'] = Variable<String>(teamName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamsCompanion(')
          ..write('id: $id, ')
          ..write('teamName: $teamName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TeamsTable extends Teams with TableInfo<$TeamsTable, Team> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $TeamsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _teamNameMeta = const VerificationMeta('teamName');
  GeneratedColumn<String> _teamName;
  @override
  GeneratedColumn<String> get teamName =>
      _teamName ??= GeneratedColumn<String>('team_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedColumn<DateTime> _createdAt;
  @override
  GeneratedColumn<DateTime> get createdAt =>
      _createdAt ??= GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, teamName, createdAt];
  @override
  String get aliasedName => _alias ?? 'teams';
  @override
  String get actualTableName => 'teams';
  @override
  VerificationContext validateIntegrity(Insertable<Team> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('team_name')) {
      context.handle(_teamNameMeta,
          teamName.isAcceptableOrUnknown(data['team_name'], _teamNameMeta));
    } else if (isInserting) {
      context.missing(_teamNameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Team map(Map<String, dynamic> data, {String tablePrefix}) {
    return Team.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TeamsTable createAlias(String alias) {
    return $TeamsTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final int id;
  final int teamId;
  final String playerName;
  final int age;
  final double height;
  final DateTime createdAt;
  Player(
      {@required this.id,
      @required this.teamId,
      @required this.playerName,
      @required this.age,
      @required this.height,
      @required this.createdAt});
  factory Player.fromData(Map<String, dynamic> data, {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Player(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      teamId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_id']),
      playerName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}player_name']),
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age']),
      height: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}height']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || teamId != null) {
      map['team_id'] = Variable<int>(teamId);
    }
    if (!nullToAbsent || playerName != null) {
      map['player_name'] = Variable<String>(playerName);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      teamId:
          teamId == null && nullToAbsent ? const Value.absent() : Value(teamId),
      playerName: playerName == null && nullToAbsent
          ? const Value.absent()
          : Value(playerName),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      teamId: serializer.fromJson<int>(json['teamId']),
      playerName: serializer.fromJson<String>(json['playerName']),
      age: serializer.fromJson<int>(json['age']),
      height: serializer.fromJson<double>(json['height']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamId': serializer.toJson<int>(teamId),
      'playerName': serializer.toJson<String>(playerName),
      'age': serializer.toJson<int>(age),
      'height': serializer.toJson<double>(height),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Player copyWith(
          {int id,
          int teamId,
          String playerName,
          int age,
          double height,
          DateTime createdAt}) =>
      Player(
        id: id ?? this.id,
        teamId: teamId ?? this.teamId,
        playerName: playerName ?? this.playerName,
        age: age ?? this.age,
        height: height ?? this.height,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('playerName: $playerName, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, teamId, playerName, age, height, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.teamId == this.teamId &&
          other.playerName == this.playerName &&
          other.age == this.age &&
          other.height == this.height &&
          other.createdAt == this.createdAt);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<int> teamId;
  final Value<String> playerName;
  final Value<int> age;
  final Value<double> height;
  final Value<DateTime> createdAt;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.teamId = const Value.absent(),
    this.playerName = const Value.absent(),
    this.age = const Value.absent(),
    this.height = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    @required int teamId,
    @required String playerName,
    @required int age,
    @required double height,
    this.createdAt = const Value.absent(),
  })  : teamId = Value(teamId),
        playerName = Value(playerName),
        age = Value(age),
        height = Value(height);
  static Insertable<Player> custom({
    Expression<int> id,
    Expression<int> teamId,
    Expression<String> playerName,
    Expression<int> age,
    Expression<double> height,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamId != null) 'team_id': teamId,
      if (playerName != null) 'player_name': playerName,
      if (age != null) 'age': age,
      if (height != null) 'height': height,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlayersCompanion copyWith(
      {Value<int> id,
      Value<int> teamId,
      Value<String> playerName,
      Value<int> age,
      Value<double> height,
      Value<DateTime> createdAt}) {
    return PlayersCompanion(
      id: id ?? this.id,
      teamId: teamId ?? this.teamId,
      playerName: playerName ?? this.playerName,
      age: age ?? this.age,
      height: height ?? this.height,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (playerName.present) {
      map['player_name'] = Variable<String>(playerName.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('playerName: $playerName, ')
          ..write('age: $age, ')
          ..write('height: $height, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  GeneratedColumn<int> _teamId;
  @override
  GeneratedColumn<int> get teamId =>
      _teamId ??= GeneratedColumn<int>('team_id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL REFERENCES teams (id)');
  final VerificationMeta _playerNameMeta = const VerificationMeta('playerName');
  GeneratedColumn<String> _playerName;
  @override
  GeneratedColumn<String> get playerName =>
      _playerName ??= GeneratedColumn<String>('player_name', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  GeneratedColumn<int> _age;
  @override
  GeneratedColumn<int> get age =>
      _age ??= GeneratedColumn<int>('age', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _heightMeta = const VerificationMeta('height');
  GeneratedColumn<double> _height;
  @override
  GeneratedColumn<double> get height =>
      _height ??= GeneratedColumn<double>('height', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedColumn<DateTime> _createdAt;
  @override
  GeneratedColumn<DateTime> get createdAt =>
      _createdAt ??= GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, teamId, playerName, age, height, createdAt];
  @override
  String get aliasedName => _alias ?? 'players';
  @override
  String get actualTableName => 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('team_id')) {
      context.handle(_teamIdMeta,
          teamId.isAcceptableOrUnknown(data['team_id'], _teamIdMeta));
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('player_name')) {
      context.handle(
          _playerNameMeta,
          playerName.isAcceptableOrUnknown(
              data['player_name'], _playerNameMeta));
    } else if (isInserting) {
      context.missing(_playerNameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age'], _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height'], _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String tablePrefix}) {
    return Player.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Matche extends DataClass implements Insertable<Matche> {
  final int id;
  final int teamId;
  final int rivalTeamId;
  final String teamA;
  final String teamB;
  final String place;
  final int overs;
  final DateTime createdAt;
  Matche(
      {@required this.id,
      @required this.teamId,
      @required this.rivalTeamId,
      @required this.teamA,
      @required this.teamB,
      @required this.place,
      @required this.overs,
      @required this.createdAt});
  factory Matche.fromData(Map<String, dynamic> data, {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Matche(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      teamId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_id']),
      rivalTeamId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rival_team_id']),
      teamA: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_a']),
      teamB: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_b']),
      place: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}place']),
      overs: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}overs']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || teamId != null) {
      map['team_id'] = Variable<int>(teamId);
    }
    if (!nullToAbsent || rivalTeamId != null) {
      map['rival_team_id'] = Variable<int>(rivalTeamId);
    }
    if (!nullToAbsent || teamA != null) {
      map['team_a'] = Variable<String>(teamA);
    }
    if (!nullToAbsent || teamB != null) {
      map['team_b'] = Variable<String>(teamB);
    }
    if (!nullToAbsent || place != null) {
      map['place'] = Variable<String>(place);
    }
    if (!nullToAbsent || overs != null) {
      map['overs'] = Variable<int>(overs);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  MatchesCompanion toCompanion(bool nullToAbsent) {
    return MatchesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      teamId:
          teamId == null && nullToAbsent ? const Value.absent() : Value(teamId),
      rivalTeamId: rivalTeamId == null && nullToAbsent
          ? const Value.absent()
          : Value(rivalTeamId),
      teamA:
          teamA == null && nullToAbsent ? const Value.absent() : Value(teamA),
      teamB:
          teamB == null && nullToAbsent ? const Value.absent() : Value(teamB),
      place:
          place == null && nullToAbsent ? const Value.absent() : Value(place),
      overs:
          overs == null && nullToAbsent ? const Value.absent() : Value(overs),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Matche.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Matche(
      id: serializer.fromJson<int>(json['id']),
      teamId: serializer.fromJson<int>(json['teamId']),
      rivalTeamId: serializer.fromJson<int>(json['rivalTeamId']),
      teamA: serializer.fromJson<String>(json['teamA']),
      teamB: serializer.fromJson<String>(json['teamB']),
      place: serializer.fromJson<String>(json['place']),
      overs: serializer.fromJson<int>(json['overs']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamId': serializer.toJson<int>(teamId),
      'rivalTeamId': serializer.toJson<int>(rivalTeamId),
      'teamA': serializer.toJson<String>(teamA),
      'teamB': serializer.toJson<String>(teamB),
      'place': serializer.toJson<String>(place),
      'overs': serializer.toJson<int>(overs),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Matche copyWith(
          {int id,
          int teamId,
          int rivalTeamId,
          String teamA,
          String teamB,
          String place,
          int overs,
          DateTime createdAt}) =>
      Matche(
        id: id ?? this.id,
        teamId: teamId ?? this.teamId,
        rivalTeamId: rivalTeamId ?? this.rivalTeamId,
        teamA: teamA ?? this.teamA,
        teamB: teamB ?? this.teamB,
        place: place ?? this.place,
        overs: overs ?? this.overs,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Matche(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('rivalTeamId: $rivalTeamId, ')
          ..write('teamA: $teamA, ')
          ..write('teamB: $teamB, ')
          ..write('place: $place, ')
          ..write('overs: $overs, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, teamId, rivalTeamId, teamA, teamB, place, overs, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Matche &&
          other.id == this.id &&
          other.teamId == this.teamId &&
          other.rivalTeamId == this.rivalTeamId &&
          other.teamA == this.teamA &&
          other.teamB == this.teamB &&
          other.place == this.place &&
          other.overs == this.overs &&
          other.createdAt == this.createdAt);
}

class MatchesCompanion extends UpdateCompanion<Matche> {
  final Value<int> id;
  final Value<int> teamId;
  final Value<int> rivalTeamId;
  final Value<String> teamA;
  final Value<String> teamB;
  final Value<String> place;
  final Value<int> overs;
  final Value<DateTime> createdAt;
  const MatchesCompanion({
    this.id = const Value.absent(),
    this.teamId = const Value.absent(),
    this.rivalTeamId = const Value.absent(),
    this.teamA = const Value.absent(),
    this.teamB = const Value.absent(),
    this.place = const Value.absent(),
    this.overs = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MatchesCompanion.insert({
    this.id = const Value.absent(),
    @required int teamId,
    @required int rivalTeamId,
    @required String teamA,
    @required String teamB,
    @required String place,
    @required int overs,
    this.createdAt = const Value.absent(),
  })  : teamId = Value(teamId),
        rivalTeamId = Value(rivalTeamId),
        teamA = Value(teamA),
        teamB = Value(teamB),
        place = Value(place),
        overs = Value(overs);
  static Insertable<Matche> custom({
    Expression<int> id,
    Expression<int> teamId,
    Expression<int> rivalTeamId,
    Expression<String> teamA,
    Expression<String> teamB,
    Expression<String> place,
    Expression<int> overs,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamId != null) 'team_id': teamId,
      if (rivalTeamId != null) 'rival_team_id': rivalTeamId,
      if (teamA != null) 'team_a': teamA,
      if (teamB != null) 'team_b': teamB,
      if (place != null) 'place': place,
      if (overs != null) 'overs': overs,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MatchesCompanion copyWith(
      {Value<int> id,
      Value<int> teamId,
      Value<int> rivalTeamId,
      Value<String> teamA,
      Value<String> teamB,
      Value<String> place,
      Value<int> overs,
      Value<DateTime> createdAt}) {
    return MatchesCompanion(
      id: id ?? this.id,
      teamId: teamId ?? this.teamId,
      rivalTeamId: rivalTeamId ?? this.rivalTeamId,
      teamA: teamA ?? this.teamA,
      teamB: teamB ?? this.teamB,
      place: place ?? this.place,
      overs: overs ?? this.overs,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (rivalTeamId.present) {
      map['rival_team_id'] = Variable<int>(rivalTeamId.value);
    }
    if (teamA.present) {
      map['team_a'] = Variable<String>(teamA.value);
    }
    if (teamB.present) {
      map['team_b'] = Variable<String>(teamB.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(place.value);
    }
    if (overs.present) {
      map['overs'] = Variable<int>(overs.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatchesCompanion(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('rivalTeamId: $rivalTeamId, ')
          ..write('teamA: $teamA, ')
          ..write('teamB: $teamB, ')
          ..write('place: $place, ')
          ..write('overs: $overs, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MatchesTable extends Matches with TableInfo<$MatchesTable, Matche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $MatchesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  GeneratedColumn<int> _teamId;
  @override
  GeneratedColumn<int> get teamId =>
      _teamId ??= GeneratedColumn<int>('team_id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL REFERENCES teams (id)');
  final VerificationMeta _rivalTeamIdMeta =
      const VerificationMeta('rivalTeamId');
  GeneratedColumn<int> _rivalTeamId;
  @override
  GeneratedColumn<int> get rivalTeamId =>
      _rivalTeamId ??= GeneratedColumn<int>('rival_team_id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL REFERENCES teams (id)');
  final VerificationMeta _teamAMeta = const VerificationMeta('teamA');
  GeneratedColumn<String> _teamA;
  @override
  GeneratedColumn<String> get teamA =>
      _teamA ??= GeneratedColumn<String>('team_a', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _teamBMeta = const VerificationMeta('teamB');
  GeneratedColumn<String> _teamB;
  @override
  GeneratedColumn<String> get teamB =>
      _teamB ??= GeneratedColumn<String>('team_b', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _placeMeta = const VerificationMeta('place');
  GeneratedColumn<String> _place;
  @override
  GeneratedColumn<String> get place =>
      _place ??= GeneratedColumn<String>('place', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _oversMeta = const VerificationMeta('overs');
  GeneratedColumn<int> _overs;
  @override
  GeneratedColumn<int> get overs =>
      _overs ??= GeneratedColumn<int>('overs', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedColumn<DateTime> _createdAt;
  @override
  GeneratedColumn<DateTime> get createdAt =>
      _createdAt ??= GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, teamId, rivalTeamId, teamA, teamB, place, overs, createdAt];
  @override
  String get aliasedName => _alias ?? 'matches';
  @override
  String get actualTableName => 'matches';
  @override
  VerificationContext validateIntegrity(Insertable<Matche> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('team_id')) {
      context.handle(_teamIdMeta,
          teamId.isAcceptableOrUnknown(data['team_id'], _teamIdMeta));
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('rival_team_id')) {
      context.handle(
          _rivalTeamIdMeta,
          rivalTeamId.isAcceptableOrUnknown(
              data['rival_team_id'], _rivalTeamIdMeta));
    } else if (isInserting) {
      context.missing(_rivalTeamIdMeta);
    }
    if (data.containsKey('team_a')) {
      context.handle(
          _teamAMeta, teamA.isAcceptableOrUnknown(data['team_a'], _teamAMeta));
    } else if (isInserting) {
      context.missing(_teamAMeta);
    }
    if (data.containsKey('team_b')) {
      context.handle(
          _teamBMeta, teamB.isAcceptableOrUnknown(data['team_b'], _teamBMeta));
    } else if (isInserting) {
      context.missing(_teamBMeta);
    }
    if (data.containsKey('place')) {
      context.handle(
          _placeMeta, place.isAcceptableOrUnknown(data['place'], _placeMeta));
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    if (data.containsKey('overs')) {
      context.handle(
          _oversMeta, overs.isAcceptableOrUnknown(data['overs'], _oversMeta));
    } else if (isInserting) {
      context.missing(_oversMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Matche map(Map<String, dynamic> data, {String tablePrefix}) {
    return Matche.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MatchesTable createAlias(String alias) {
    return $MatchesTable(attachedDatabase, alias);
  }
}

class Score extends DataClass implements Insertable<Score> {
  final int id;
  final int playerId;
  final int teamId;
  final int matchId;
  final int run;
  final int ball;
  final bool isOut;
  final DateTime createdAt;
  Score(
      {@required this.id,
      @required this.playerId,
      @required this.teamId,
      @required this.matchId,
      @required this.run,
      @required this.ball,
      @required this.isOut,
      @required this.createdAt});
  factory Score.fromData(Map<String, dynamic> data, {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return Score(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      playerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}player_id']),
      teamId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_id']),
      matchId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}match_id']),
      run: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}run']),
      ball: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ball']),
      isOut: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_out']),
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || playerId != null) {
      map['player_id'] = Variable<int>(playerId);
    }
    if (!nullToAbsent || teamId != null) {
      map['team_id'] = Variable<int>(teamId);
    }
    if (!nullToAbsent || matchId != null) {
      map['match_id'] = Variable<int>(matchId);
    }
    if (!nullToAbsent || run != null) {
      map['run'] = Variable<int>(run);
    }
    if (!nullToAbsent || ball != null) {
      map['ball'] = Variable<int>(ball);
    }
    if (!nullToAbsent || isOut != null) {
      map['is_out'] = Variable<bool>(isOut);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  ScoresCompanion toCompanion(bool nullToAbsent) {
    return ScoresCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      playerId: playerId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerId),
      teamId:
          teamId == null && nullToAbsent ? const Value.absent() : Value(teamId),
      matchId: matchId == null && nullToAbsent
          ? const Value.absent()
          : Value(matchId),
      run: run == null && nullToAbsent ? const Value.absent() : Value(run),
      ball: ball == null && nullToAbsent ? const Value.absent() : Value(ball),
      isOut:
          isOut == null && nullToAbsent ? const Value.absent() : Value(isOut),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Score.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Score(
      id: serializer.fromJson<int>(json['id']),
      playerId: serializer.fromJson<int>(json['playerId']),
      teamId: serializer.fromJson<int>(json['teamId']),
      matchId: serializer.fromJson<int>(json['matchId']),
      run: serializer.fromJson<int>(json['run']),
      ball: serializer.fromJson<int>(json['ball']),
      isOut: serializer.fromJson<bool>(json['isOut']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playerId': serializer.toJson<int>(playerId),
      'teamId': serializer.toJson<int>(teamId),
      'matchId': serializer.toJson<int>(matchId),
      'run': serializer.toJson<int>(run),
      'ball': serializer.toJson<int>(ball),
      'isOut': serializer.toJson<bool>(isOut),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Score copyWith(
          {int id,
          int playerId,
          int teamId,
          int matchId,
          int run,
          int ball,
          bool isOut,
          DateTime createdAt}) =>
      Score(
        id: id ?? this.id,
        playerId: playerId ?? this.playerId,
        teamId: teamId ?? this.teamId,
        matchId: matchId ?? this.matchId,
        run: run ?? this.run,
        ball: ball ?? this.ball,
        isOut: isOut ?? this.isOut,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Score(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('teamId: $teamId, ')
          ..write('matchId: $matchId, ')
          ..write('run: $run, ')
          ..write('ball: $ball, ')
          ..write('isOut: $isOut, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, playerId, teamId, matchId, run, ball, isOut, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Score &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.teamId == this.teamId &&
          other.matchId == this.matchId &&
          other.run == this.run &&
          other.ball == this.ball &&
          other.isOut == this.isOut &&
          other.createdAt == this.createdAt);
}

class ScoresCompanion extends UpdateCompanion<Score> {
  final Value<int> id;
  final Value<int> playerId;
  final Value<int> teamId;
  final Value<int> matchId;
  final Value<int> run;
  final Value<int> ball;
  final Value<bool> isOut;
  final Value<DateTime> createdAt;
  const ScoresCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.teamId = const Value.absent(),
    this.matchId = const Value.absent(),
    this.run = const Value.absent(),
    this.ball = const Value.absent(),
    this.isOut = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ScoresCompanion.insert({
    this.id = const Value.absent(),
    @required int playerId,
    @required int teamId,
    @required int matchId,
    @required int run,
    @required int ball,
    this.isOut = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : playerId = Value(playerId),
        teamId = Value(teamId),
        matchId = Value(matchId),
        run = Value(run),
        ball = Value(ball);
  static Insertable<Score> custom({
    Expression<int> id,
    Expression<int> playerId,
    Expression<int> teamId,
    Expression<int> matchId,
    Expression<int> run,
    Expression<int> ball,
    Expression<bool> isOut,
    Expression<DateTime> createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (teamId != null) 'team_id': teamId,
      if (matchId != null) 'match_id': matchId,
      if (run != null) 'run': run,
      if (ball != null) 'ball': ball,
      if (isOut != null) 'is_out': isOut,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ScoresCompanion copyWith(
      {Value<int> id,
      Value<int> playerId,
      Value<int> teamId,
      Value<int> matchId,
      Value<int> run,
      Value<int> ball,
      Value<bool> isOut,
      Value<DateTime> createdAt}) {
    return ScoresCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      teamId: teamId ?? this.teamId,
      matchId: matchId ?? this.matchId,
      run: run ?? this.run,
      ball: ball ?? this.ball,
      isOut: isOut ?? this.isOut,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (matchId.present) {
      map['match_id'] = Variable<int>(matchId.value);
    }
    if (run.present) {
      map['run'] = Variable<int>(run.value);
    }
    if (ball.present) {
      map['ball'] = Variable<int>(ball.value);
    }
    if (isOut.present) {
      map['is_out'] = Variable<bool>(isOut.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScoresCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('teamId: $teamId, ')
          ..write('matchId: $matchId, ')
          ..write('run: $run, ')
          ..write('ball: $ball, ')
          ..write('isOut: $isOut, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ScoresTable extends Scores with TableInfo<$ScoresTable, Score> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String _alias;
  $ScoresTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int> _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _playerIdMeta = const VerificationMeta('playerId');
  GeneratedColumn<int> _playerId;
  @override
  GeneratedColumn<int> get playerId =>
      _playerId ??= GeneratedColumn<int>('player_id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL REFERENCES players (id)');
  final VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  GeneratedColumn<int> _teamId;
  @override
  GeneratedColumn<int> get teamId =>
      _teamId ??= GeneratedColumn<int>('team_id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL REFERENCES teams (id)');
  final VerificationMeta _matchIdMeta = const VerificationMeta('matchId');
  GeneratedColumn<int> _matchId;
  @override
  GeneratedColumn<int> get matchId =>
      _matchId ??= GeneratedColumn<int>('match_id', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL REFERENCES matches (id)');
  final VerificationMeta _runMeta = const VerificationMeta('run');
  GeneratedColumn<int> _run;
  @override
  GeneratedColumn<int> get run =>
      _run ??= GeneratedColumn<int>('run', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _ballMeta = const VerificationMeta('ball');
  GeneratedColumn<int> _ball;
  @override
  GeneratedColumn<int> get ball =>
      _ball ??= GeneratedColumn<int>('ball', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _isOutMeta = const VerificationMeta('isOut');
  GeneratedColumn<bool> _isOut;
  @override
  GeneratedColumn<bool> get isOut =>
      _isOut ??= GeneratedColumn<bool>('is_out', aliasedName, false,
          type: const BoolType(),
          requiredDuringInsert: false,
          defaultConstraints: 'CHECK (is_out IN (0, 1))',
          defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedColumn<DateTime> _createdAt;
  @override
  GeneratedColumn<DateTime> get createdAt =>
      _createdAt ??= GeneratedColumn<DateTime>('created_at', aliasedName, false,
          type: const IntType(),
          requiredDuringInsert: false,
          defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns =>
      [id, playerId, teamId, matchId, run, ball, isOut, createdAt];
  @override
  String get aliasedName => _alias ?? 'scores';
  @override
  String get actualTableName => 'scores';
  @override
  VerificationContext validateIntegrity(Insertable<Score> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('player_id')) {
      context.handle(_playerIdMeta,
          playerId.isAcceptableOrUnknown(data['player_id'], _playerIdMeta));
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('team_id')) {
      context.handle(_teamIdMeta,
          teamId.isAcceptableOrUnknown(data['team_id'], _teamIdMeta));
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('match_id')) {
      context.handle(_matchIdMeta,
          matchId.isAcceptableOrUnknown(data['match_id'], _matchIdMeta));
    } else if (isInserting) {
      context.missing(_matchIdMeta);
    }
    if (data.containsKey('run')) {
      context.handle(
          _runMeta, run.isAcceptableOrUnknown(data['run'], _runMeta));
    } else if (isInserting) {
      context.missing(_runMeta);
    }
    if (data.containsKey('ball')) {
      context.handle(
          _ballMeta, ball.isAcceptableOrUnknown(data['ball'], _ballMeta));
    } else if (isInserting) {
      context.missing(_ballMeta);
    }
    if (data.containsKey('is_out')) {
      context.handle(
          _isOutMeta, isOut.isAcceptableOrUnknown(data['is_out'], _isOutMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Score map(Map<String, dynamic> data, {String tablePrefix}) {
    return Score.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ScoresTable createAlias(String alias) {
    return $ScoresTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TeamsTable _teams;
  $TeamsTable get teams => _teams ??= $TeamsTable(this);
  $PlayersTable _players;
  $PlayersTable get players => _players ??= $PlayersTable(this);
  $MatchesTable _matches;
  $MatchesTable get matches => _matches ??= $MatchesTable(this);
  $ScoresTable _scores;
  $ScoresTable get scores => _scores ??= $ScoresTable(this);
  TeamDao _teamDao;
  TeamDao get teamDao => _teamDao ??= TeamDao(this as AppDatabase);
  PlayerDao _playerDao;
  PlayerDao get playerDao => _playerDao ??= PlayerDao(this as AppDatabase);
  MatchDao _matchDao;
  MatchDao get matchDao => _matchDao ??= MatchDao(this as AppDatabase);
  ScoreDao _scoreDao;
  ScoreDao get scoreDao => _scoreDao ??= ScoreDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [teams, players, matches, scores];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TeamDaoMixin on DatabaseAccessor<AppDatabase> {
  $TeamsTable get teams => attachedDatabase.teams;
  $PlayersTable get players => attachedDatabase.players;
}
mixin _$PlayerDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlayersTable get players => attachedDatabase.players;
}
mixin _$MatchDaoMixin on DatabaseAccessor<AppDatabase> {
  $MatchesTable get matches => attachedDatabase.matches;
  $TeamsTable get teams => attachedDatabase.teams;
}
mixin _$ScoreDaoMixin on DatabaseAccessor<AppDatabase> {
  $ScoresTable get scores => attachedDatabase.scores;
  $PlayersTable get players => attachedDatabase.players;
  $TeamsTable get teams => attachedDatabase.teams;
  $MatchesTable get matches => attachedDatabase.matches;
}
