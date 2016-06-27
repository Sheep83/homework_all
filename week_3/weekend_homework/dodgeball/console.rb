require_relative( 'models/teams' )
require_relative( 'models/matches' )
# require_relative( 'models/matches_played')
require_relative( 'db/sql_runner' )
require( 'pry-byebug' )

runner = SqlRunner.new({dbname: 'dodgeball', host: 'localhost'})

team1 = Team.new({'name' => 'Aberdeen'}, runner)
team2 = Team.new({'name' => 'Glasgow'}, runner)
team3 = Team.new({'name' => 'Edinburgh'}, runner)
team4 = Team.new({'name' => 'Dundee'}, runner)
team1 = team1.save
team2 = team2.save
team3 = team3.save
team4 = team4.save

# binding.pry
match1 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team3.id, 'home_team_score' => '2', 'away_team_score' => '0'}, runner)
match2 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team2.id, 'home_team_score' => '1', 'away_team_score' => '0'}, runner)
match3 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team2.id, 'home_team_score' => '3', 'away_team_score' => '0'}, runner)
match4 = Match.new({'home_team_id' => team2.id, 'away_team_id' => team1.id, 'home_team_score' => '0', 'away_team_score' => '2'}, runner)
match5 = Match.new({'home_team_id' => team4.id, 'away_team_id' => team1.id, 'home_team_score' => '0', 'away_team_score' => '2'}, runner)
match6 = Match.new({'home_team_id' => team1.id, 'away_team_id' => team4.id, 'home_team_score' => '3', 'away_team_score' => '1'}, runner)
match7 = Match.new({'home_team_id' => team2.id, 'away_team_id' => team4.id, 'home_team_score' => '0', 'away_team_score' => '1'}, runner)
match8 = Match.new({'home_team_id' => team3.id, 'away_team_id' => team2.id, 'home_team_score' => '1', 'away_team_score' => '0'}, runner)

match1 = match1.save
match2 = match2.save
match3 = match3.save
match4 = match4.save
match5 = match5.save
match6 = match6.save
match7 = match7.save
match8 = match8.save

results1 = TeamMatch.new({'team_id' => team1.id, 'match_id' => match3.id}, runner)
results1 = results1.save
match1.teams()

# Team.delete_all(runner)
# Match.delete_all(runner)










