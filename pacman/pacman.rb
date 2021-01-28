require_relative 'ui'

def play
  map = read_map 1

  loop do
    draw_map map
    direction = asking_for_move

    hero = find_hero map
    new_position = calc_new_position hero, direction

    next unless a_valid_position? map, new_position

    map[hero[0]][hero[1]] = ' '
    map[new_position[0]][new_position[1]] = 'H'
  end
end

def read_map(number)
  file = "./maps/map#{number}.txt"
  text = File.read file
  text.split "\n"
end

def find_hero(map)
  hero_character = 'H'
  map.each_with_index do |current_line, line|
    hero_column = current_line.index hero_character
    return [line, hero_column] if hero_column
  end
end

def calc_new_position(hero, direction)
  hero = hero.dup

  case direction
  when 'W'
    hero[0] -= 1
  when 'S'
    hero[0] += 1
  when 'A'
    hero[1] -= 1
  when 'D'
    hero[1] += 1
  end
  hero
end

def a_valid_position?(map, position)
  lines = map.size
  columns = map[0].size

  cross_the_line = position[0].negative? || position[0] >= lines
  cross_the_columns = position[1].negative? || position[1] >= columns

  return false if cross_the_columns || cross_the_line || map[position[0]][position[1]] == 'X'

  true
end

def init_game
  welcome
  play
end
