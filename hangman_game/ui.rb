def welcome
  puts "\nBem vindo ao jogo da forca"
  puts "\nQual é o seu nome?"
  name = gets.strip
  puts "\nComeçaremos o jogo para você, #{name}!"
  name
end

def show_choosing_a_secret_word_message
  puts "\nEscolhendo uma palavra secreta"
end

def show_choosed_secreat_word(secret_word)
  puts "\nEscolhida uma palavra com #{secret_word.size} letras... boa sorte"
end

def asking_for_a_word_or_letter
  puts "\nEntre com a letra ou palavra"
  kick = gets.strip.downcase
  puts "\nSerá que acertou? Você chutou #{kick}"
  kick
end

def show_header(errors, kicks, mask)
  puts "\n\nErros até agora: #{errors}"
  puts "Palavra: #{mask}"
  puts "\nChutes até agora: #{kicks}"
end

def you_already_kicked(kick)
  puts "\nVocê já chutou #{kick}"
end

def letter_not_found
  puts "\nLetra não encontrada!"
end

def letter_found(total_found)
  puts "\nLetra encontrada #{total_found} vezes!"
end

def congratulations
  puts 'Parabéns! Acertou!'
end

def you_missed
  puts "\nQue pena... errou!"
end

def you_won(points_so_far)
  puts "\nVocê ganhou #{points_so_far} pontos"
end

def dont_you_want_to_play?
  puts "\nDeseja jogar novamente? (S/N)"
  decision = gets.strip
  decision.upcase == 'N'
end

def show_total_points(points)
  puts "\nVocê consquistou um total de #{points} pontos."
end

def show_last_champion(info)
  puts "\nO campeao atual é #{info[0]}"
end
