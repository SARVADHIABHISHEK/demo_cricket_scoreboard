import 'package:demo_cricket_scorecard/models/AddScoremodel.dart';
import 'package:demo_cricket_scorecard/models/team_model.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import '../models/create_match_model.dart';
import '../models/player_model.dart';

part 'drift_database.g.dart';

/// Teams table schema
class Teams extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get teamName => text()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

/// Players table schema
class Players extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get teamId =>
      integer().customConstraint('NOT NULL REFERENCES teams (id)')();

  TextColumn get playerName => text()();

  IntColumn get age => integer()();

  RealColumn get height => real()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

/// Match tables schema
class Matches extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get teamId =>
      integer().customConstraint('NOT NULL REFERENCES teams (id)')();

  IntColumn get rivalTeamId =>
      integer().customConstraint('NOT NULL REFERENCES teams (id)')();

  TextColumn get teamA => text()();

  TextColumn get teamB => text()();

  TextColumn get place => text()();


  IntColumn get overs => integer()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

/// Score table
class Scores extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get playerId =>
      integer().customConstraint('NOT NULL REFERENCES players (id)')();

  IntColumn get teamId =>
      integer().customConstraint('NOT NULL REFERENCES teams (id)')();

  IntColumn get matchId =>
      integer().customConstraint('NOT NULL REFERENCES matches (id)')();

  IntColumn get run => integer()();

  IntColumn get ball => integer()();

  BoolColumn get isOut => boolean().withDefault( const Constant(false))();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

@DriftDatabase(
    tables: [Teams, Players, Matches, Scores],
    daos: [TeamDao, PlayerDao, MatchDao, ScoreDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(NativeDatabase.memory(logStatements: true));

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [Teams, Players])
class TeamDao extends DatabaseAccessor<AppDatabase> with _$TeamDaoMixin {
  final AppDatabase db;

  TeamDao(this.db) : super(db);

  Stream<List<TeamModel>> watchTeams() {
    final query = select(teams)
        .join([leftOuterJoin(players, players.teamId.equalsExp(teams.id))]);
    return query.watch().map((result) {
      return result.map((row) {
        return TeamModel.fromEntity(row.readTable(teams),
            players: [PlayerModel.fromJson(row.readTable(players).toJson())]);
      }).toList();

    });
  }




  Future<List<Team>> get allTeamName => select(teams).get();


  Future<List<Player>> get allPlayerName => select(players).get();


  Future insertTeam(TeamModel team) {
    return db.batch((batch) async {
      final id = await into(teams).insert(Team.fromJson(team.toJson()));
      batch.insertAll(
          players,
          team.players
              .map((e) => Player.fromJson((e..teamId = id).toJson()))
              .toList());
    });
  }
}

@DriftAccessor(tables: [Players])
class PlayerDao extends DatabaseAccessor<AppDatabase> with _$PlayerDaoMixin {
  final AppDatabase db;

  PlayerDao(this.db) : super(db);

  Stream<List<Player>> watchTeams() => select(players).watch();

  Future<int> insertTeam(Insertable<Player> player) =>
      into(players).insert(player);
}

@DriftAccessor(tables: [Matches, Teams])
class MatchDao extends DatabaseAccessor<AppDatabase> with _$MatchDaoMixin {
  final AppDatabase db;

  MatchDao(this.db) : super(db);

  Future<int> insertMatch(CreateMatchModel createMatch) async {
    return await into(matches).insert(Matche.fromJson(createMatch.toJson()));
  }

  Future<List<Matche>>  watchMatches() => select(matches).get();

}

@DriftAccessor(tables: [Scores, Players, Teams, Matches])
class ScoreDao extends DatabaseAccessor<AppDatabase> with _$ScoreDaoMixin {
  final AppDatabase db;

  ScoreDao(this.db) : super(db);

  Future<List<Score>> watchScores() => select(scores).get();

  Future<int> insertPlayer(AddScoreModel player) async {
    return await into(scores).insert(Score.fromJson(player.toJson()));
  }

}
