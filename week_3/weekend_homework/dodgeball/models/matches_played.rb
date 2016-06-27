require( 'pg' )
require_relative('teams')
# require_relative('matches')


class TeamMatch

  attr_reader :id, :team_id, :matchid

  def initialize( options, runner )
    @id = options['id'].to_i
    @team_id = options['team_id'].to_i
    @match_id = options['match_id'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO played_matches (
      team_id, match_id) 
      VALUES (
        #{@team_id}, 
        #{@match_id}
      ) RETURNING *"
    return TeamMatch.map_item(sql, @runner)
  end
  
  def self.all(runner)
    sql = "SELECT * FROM played_matches"
    return TeamMatch.map_items(sql, runner)
  end

  def self.delete_all(runner) 
    sql = "DELETE FROM played_matches"
    runner.run(sql)
  end

    def self.map_items(sql, runner)
    matches = runner.run( sql )
    result = matches.map { |match| TeamMatch.new( match, runner ) }
    return result
    end

    def self.map_item(sql, runner)
      result = TeamMatch.map_items(sql, runner)
      return result.first
    end
    
end










