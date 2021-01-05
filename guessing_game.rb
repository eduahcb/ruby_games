def welcome
  puts 'Bem-vindo ao jogo de adivinhação'
  puts 'Qual é o seu nome?'
  player = gets

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
  gets
end

def result_game; end

welcome
secret_number = choosing_a_random_number
puts "\n"

limit_of_tries = 3
(1..limit_of_tries).each do |tries|
  puts "Tentativa #{tries} de #{limit_of_tries}"
  kick = select_a_number
  puts "Será que acertou? Você chutou #{kick}"

  that_is_right = secret_number == kick.to_i
  if that_is_right
    puts 'acertou!!!'
    break
  else
    is_greater = secret_number > kick.to_i

    if is_greater
      puts 'O numero é maior!'
    else
      puts 'O numero é menor!'
    end
  end
end
