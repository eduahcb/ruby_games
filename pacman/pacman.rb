require_relative 'ui'

def play
  map = read_map 2

  loop do
    draw_map map
    direction = asking_for_move

    hero = find_hero map
    new_position = calc_new_position hero, direction

    next unless a_valid_position? map, new_position

    map[hero[0]][hero[1]] = ' '
    map[new_position[0]][new_position[1]] = 'H'
    map = move_ghosts map

    if player_lost? map
      game_over
      break
    end
  end
end

def player_lost?(map)
  !find_hero(map)
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
  nil
end

def calc_new_position(hero, direction)
  hero = hero.dup

  moviments = {
    'W' => [-1, 0],
    'S' => [+1, 0],
    'A' => [0, -1],
    'D' => [0, +1]
  }
  moviment = moviments[direction]
  hero[0] += moviment[0]
  hero[1] += moviment[1]
  hero
end

def a_valid_position?(map, position)
  lines = map.size
  columns = map[0].size

  cross_the_line = position[0].negative? || position[0] >= lines
  cross_the_columns = position[1].negative? || position[1] >= columns

  return false if cross_the_columns || cross_the_line

  local_value = map[position[0]][position[1]]
  return false if %w[X F].include?(local_value)

  true
end

def move_ghosts(map)
  ghost_character = 'F'
  new_map = copy_map map

  map.each_with_index do |current_line, line|
    current_line.chars.each_with_index do |current_character, column|
      is_a_ghost = current_character == ghost_character
      move_ghost(map, new_map, line, column) if is_a_ghost
    end
  end
  new_map
end

def move_ghost(map, new_map, line, column)
  positions = valid_positions_from map, new_map, [line, column]

  return if positions.empty?

  random = rand positions.size
  position = positions[random]

  map[line][column] = ' '
  new_map[position[0]][position[1]] = 'F'
end

def valid_positions_from(map, new_map, position)
  positions = []
  moviments = [
    [-1, 0],
    [+1, 0],
    [0, -1],
    [0, +1]
  ]

  moviments.each do |moviment|
    new_position = sum_vector position, moviment
    positions << new_position if a_valid_position?(map, new_position) && a_valid_position?(new_map, new_position)
  end
  positions
end

def sum_vector(vector1, vector2)
  [vector1[0] + vector2[0], vector1[1] + vector2[1]]
end

def copy_map(map)
  map.join("\n").tr('F', ' ').split("\n")
end

def init_game
  welcome
  play
end
