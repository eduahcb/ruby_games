def welcome
  puts 'Bem-vindo ao jogo de adivinhação'
  puts 'Qual é o seu nome?'
  player = gets.strip

  puts "\n\n"
  puts "O Jogo irá iniciar, #{player}"
end

def choosing_a_random_number
  puts 'Escolhendo um numero secreto de 0 e 200...'
  175
end

def select_a_number
  puts "\n\n"
  puts 'Escolha um numero:'
  gets.strip
end

def asking_for_a_number(kicks, limit_of_tries, tries)
  puts "Tentativa #{tries} de #{limit_of_tries}"
  puts "Chutes até agora #{kicks}"
  kick = select_a_number
  puts "Será que acertou? Você chutou #{kick}"
  kick.to_i
end

def check_if_is_right(secret_number, kick)
  that_is_right = secret_number == kick
  if that_is_right
    puts 'acertou!!!'
    return true
  end
  is_greater = secret_number > kick

  if is_greater
    puts 'O numero é maior!'
  else
    puts 'O numero é menor!'
  end
  false
end

def main
  welcome
  secret_number = choosing_a_random_number

  kicks = []
  limit_of_tries = 3

  (1..limit_of_tries).each do |tries|
    kick = asking_for_a_number kicks, limit_of_tries, tries
    kicks << kick

    break if check_if_is_right secret_number, kick
  end
end

main
