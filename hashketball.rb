require 'pry'

def game_hash
  {
    away: { team_name: "Charlotte Hornets",
    colors: ['Turquoise', 'Purple'],
    players: [
      {player_name: 'Jeff Adrien',
      number: 4,
      shoe: 18,
      points: 10, 
      rebounds: 1,
      assists: 1,
      steals: 2,
      blocks: 7,
      slam_dunks: 2 },
      {player_name: 'Bismack Biyombo',
      number: 0,
      shoe: 16,
      points: 12,
      rebounds: 4,
      assists: 7,
      steals: 22,
      blocks: 15,
      slam_dunks: 10},
      {player_name: 'DeSagna Diop',
      number: 2,
      shoe: 14,
      points: 24,
      rebounds: 12,
      assists: 12,
      steals: 4,
      blocks: 5,
      slam_dunks: 5},
      {player_name: 'Ben Gordon',
      number: 8,
      shoe: 15,
      points: 33,
      rebounds: 3,
      assists: 2,
      steals: 1,
      blocks: 1,
      slam_dunks: 0},
      {player_name: 'Kemba Walker',
      number: 33,
      shoe: 15,
      points: 6, 
      rebounds: 12,
      assists: 12,
      steals: 7,
      blocks: 5,
      slam_dunks: 12}
      ] },
    
    home: { team_name: 'Brooklyn Nets',
    colors: ['Black', 'White'],
    players: [
      {player_name: 'Alan Anderson',
      number: 0,
      shoe: 16,
      points: 22,
      rebounds: 12,
      assists: 12,
      steals: 3,
      blocks: 1,
      slam_dunks: 1 },
      {player_name: 'Reggie Evans',
      number: 30,
      shoe: 14,
      points: 12,
      rebounds: 12,
      assists: 12,
      steals: 12,
      blocks: 12,
      slam_dunks: 7},
      {player_name: 'Brook Lopez',
      number: 11,
      shoe: 17,
      points: 17,
      rebounds: 19,
      assists: 10,
      steals: 3,
      blocks: 1,
      slam_dunks: 15},
      {player_name: 'Mason Plumlee',
      number: 1,
      shoe: 19,
      points: 26,
      rebounds: 11,
      assists: 6,
      steals: 3,
      blocks: 8,
      slam_dunks: 5},
      {player_name: 'Jason Terry',
      number: 31,
      shoe: 15,
      points: 19,
      rebounds: 2,
      assists: 2,
      steals: 4,
      blocks: 11,
      slam_dunks: 1}
    
    ] }
  }
end


def num_points_scored(player_name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:player_name]==player_name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:player_name]==name
        return player[:shoe]
      end
    end
  end
end
        
def team_colors(team_name)
  if team_name.downcase == "brooklyn nets"
    return game_hash[:home][:colors]
  else return game_hash[:away][:colors]
end
end

def team_names
  game_hash.map do |team, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  numbers=[]
  game_hash.each do |team, team_data|
    if team_data[:team_name]==team_name
      team_data.each do |key, value|
        if key== :players
          value.each do |player|
            numbers.push(player[:number])
          end
        end
      end
    end
  end
  return numbers
end

def player_stats(player_name)
  game_hash.each do |team, team_data|
    team_data.each do |key, value|
      if key==:players
        value.each do |player|
          if player_name==player[:player_name]
            player.delete(:player_name)
            return player
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_unit=0
  rebounds=0
  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:shoe]>shoe_unit
        shoe_unit=player[:shoe]
        rebounds=player[:rebounds]
      end
    end
  end
      return rebounds
 end
 
 def most_points_scored
   high_score=0
   big_winner=''
   game_hash.each do |value, key|
     key[:players].each do |player|
       points=player[:points]
       if points>high_score
         high_score=points
         big_winner=player[:player_name]
       end
     end
   end
   return big_winner
 end
 
 def winning_team
   combined_points=0
   winner=''
   game_hash.each do|team, team_data|
   team_points=0
   team_name=game_hash[team][:team_name]
    team_data[:players].each do |player|
   points=player[:points]
   team_points+=points
 end
 winner, combined_points = team_name, team_points if team_points > combined_points
 end
 return winner 
 end
 