require "pry"

bachelor_data = { 
  "season 30": [
    {
      "name":      "Beth Smalls",
      "age":       "26",
      "hometown":  "Great Falls, Virginia",
      "occupation":"Nanny/Freelance Journalist",
      "status":    "Winner"
    },
    {
      "name":       "Becca Tilley",
      "age":        "27",
      "hometown":   "Shreveport, Louisiana",
      "occupation": "Chiropractic Assistant",
      "status":     "Eliminated Week 8"
    }
  ],
  "season 29": [
    {
      "name":      "Ashley Yeats",
      "age":       "24",
      "hometown":  "Denver, Colorado",
      "occupation":"Dental Assitant",
      "status":    "Winner"
    },
    {
      "name":       "Sam Grover",
      "age":        "29",
      "hometown":   "Denver, Colorado",
      "occupation": "Entertainer",
      "status":     "Eliminated Week 6"
    }
  ]
}


def get_first_name_of_season_winner(data, season)
  data.each do |season_name, contestant_data|
    if season_name.to_s == season
      contestant_data.each do |contestant_line|
        contestant_line.each do |contestant_attributes, contestant_data|
          if contestant_attributes == :status && contestant_data == "Winner"
            name = contestant_line[:name]
            name = name.split(" ")
            name = name[0]
            return name
          end 
        end 
      end
    end 
  end 
end

get_first_name_of_season_winner(bachelor_data, "season 30")

def get_contestant_name(data, occupation)
  data.each do |season_name, season_data|
      season_data.each do |contestant_line|
        contestant_line.each do |contestant_attributes, contestant_data|
          if contestant_attributes == :occupation && contestant_data == occupation
            return contestant_line[:name]
          end
        end
      end
    end
end

get_contestant_name(bachelor_data, "Chiropractic Assistant")

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_name, season_data|
      season_data.each do |contestant_line|
        contestant_line.each do |contestant_attributes, contestant_data| 
          if contestant_attributes = :hometown && contestant_data == hometown
            counter += 1
          end
        end
      end
    end
  return counter
end

count_contestants_by_hometown(bachelor_data, 'Denver, Colorado')

def get_occupation(data, hometown)
  data.each do |season_name, season_data|
      season_data.each do |contestant_line|
        contestant_line.each do |contestant_attributes, contestant_data| 
          if contestant_attributes = :hometown && contestant_data == hometown
            return contestant_line[:occupation]
          end
        end
      end
  end 
end

get_occupation(bachelor_data, "Denver, Colorado")


def get_average_age_for_season_array(data, season)
  age_of_contestants_in_season = []
  data.each do |season_name, season_data|
    if season_name.to_s == season
      season_data.each do |contestant_line|        
        contestant_line.each do |contestant_attributes, contestant_data| 
          if contestant_attributes == :age
            age_of_contestants_in_season << contestant_data
          end
        end
      end
    end
  end
  return age_of_contestants_in_season
end


def get_average_age_for_season(data, season)
  array = get_average_age_for_season_array(data, season)
  sum = 0
  avg = 0.0
  for x in array do 
    x = x.to_f
    sum = x + sum
  end
  avg = sum / array.length
  return avg
end

puts get_average_age_for_season(bachelor_data, "season 30")
