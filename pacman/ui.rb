def welcome
  puts 'Bem vindo ao pacman'
  puts "\nQual é o seu nome?"
  name = gets.strip
  puts "\nComeçaremos o jogo para você, #{name}"
  name
end

def draw_map(map)
  puts map
end

def asking_for_move
  puts 'Para onde deseja ir?'
  gets.strip.upcase
end

def game_over
  puts 'Você perdeu!'
end
