require "pry"

def game_hash
  {
    home: {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    away: {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

#_________________________________

def num_points_scored(player_name)
  game_hash.each do |location, team_data| #home/all_data
    team_data[:players].each do |player, stats|
      if player == player_name
        #binding.pry
        return stats[:points]
      end
    end
  end
end

#puts num_points_scored("Reggie Evans")

#_________________________________

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player == name
        return stats[:shoe]
      end
    end
  end
end

#____________________________________


def team_colors(name_of_team)
  game_hash.each do |location, team_data|
    team = team_data[:team_name]
    if team == name_of_team
      return team_data[:colors]
      #binding.pry
    end
  end
end

#__________________________

def team_names
  game_hash.values.collect do |name|
    name.fetch(:team_name)
  end
end

#_________________________________

def player_numbers(team)
  jersey_nums = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |name_of_player, stats|
        jersey_nums << stats[:number]
      end
    end
  end
  return jersey_nums
end

#puts player_numbers(:team_names)

#____________________________________

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name_of_player, stats|
      if name_of_player == player
        return stats
        #binding.pry
      end
    end
  end
end

#puts player_stats("Brendan Haywood")
#_________________________________

def big_shoe_rebounds
  game_hash.each do |location, team_data|
    team_data[:players].each do |name_of_player, stats|
      #binding.pry
      if stats[:shoe] == biggest_shoe
        return stats[:rebounds]
      end
    end
  end
end

#__________________________


def biggest_shoe
  game_hash[:home][:players].max_by { |_name, stats| stats[:shoe] }.last[:shoe]
end
