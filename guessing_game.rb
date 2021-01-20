def welcome
  puts "\nBem-vindo ao jogo de adivinhação"
  puts "\nQual é o seu nome?"
  gets.strip
end

def start_game_message(player)
  puts "\nO Jogo irá iniciar, #{player}"
end

def asking_for_level
  puts 'Qual a dificuldade do jogo? (1 fácil.. 5 dificil)'
  gets.to_i
end

def choosing_a_random_number(level)
  max = case level
        when 1
          10
        when 2
          60
        when 3
          100
        when 4
          150
        else
          200
        end
  puts "\nEscolhendo um numero secreto de 1 e #{max}..."
  rand(max) + 1
end

def select_a_number
  puts "\nEscolha um numero:"
  gets.strip
end

def asking_for_a_number(kicks, limit_of_tries, tries)
  puts "\n\nTentativa #{tries} de #{limit_of_tries}"
  puts "\nChutes até agora #{kicks}"
  kick = select_a_number
  puts "\nSerá que acertou? Você chutou #{kick}"
  kick.to_i
end

def check_if_is_right(secret_number, kick)
  that_is_right = secret_number == kick
  if that_is_right
    puts "\nacertou!!!"
    return true
  end
  is_greater = secret_number > kick

  if is_greater
    puts "\nO numero é maior!"
  else
    puts "\nO numero é menor!"
  end
  puts "\nAperte alguma tecla para continuar:"
  gets
  false
end

def play(level)
  secret_number = choosing_a_random_number level

  points = 1000
  kicks = []
  limit_of_tries = 3

  (1..limit_of_tries).each do |tries|
    kick = asking_for_a_number kicks, limit_of_tries, tries
    kicks << kick

    points_sor_far = (kick - secret_number).abs / 2.0
    points -= points_sor_far
    break if check_if_is_right secret_number, kick
  end
  puts "Você conquistou #{points} pontos."
end

def dont_you_want_to_play?
  puts "\n\nVocê quer continuar jogando? (S/N)"
  decision = gets.strip
  decision.upcase == 'N'
end

def main
  player = welcome
  start_game_message player
  level = asking_for_level

  loop do
    play level
    break if dont_you_want_to_play?
  end
end

main
