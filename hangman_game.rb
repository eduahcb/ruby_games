def welcome
  puts "\nBem vindo ao jogo da forca"
  puts "\nQual é o seu nome?"
  name = gets.strip
  puts "\nComeçaremos o jogo para você, #{name}!"
end

def choosing_a_secret_word
  puts "\nEscolhendo uma palavra secreta"
  secret_word = 'programador'
  puts "\nEscolhida uma palavra com #{secret_word.size} letras... boa sorte"
  secret_word
end

def asking_for_a_word_or_letter(kicks, errors)
  puts "\n\nErros até agora: #{errors}"
  puts "\nChutes até agora: #{kicks}"
  puts "\nEntre com a letra ou palavra"
  kick = gets.strip
  puts "\nSerá que acertou? Você chutou #{kick}"
  kick
end

def play
  secret_word = choosing_a_secret_word

  errors = 0
  kicks = []
  points_sor_far = 0

  while errors < 5
    kick = asking_for_a_word_or_letter(kicks, errors)
    is_a_letter = kick.size == 1

    if is_a_letter
      points_sor_far -= 30
    else
      hit = kick == secret_word

      if hit
        puts 'Parabéns! Acertou!'
        points_sor_far += 100
        break
      end
    end
  end
  puts "\nVocê ganhou #{points_sor_far} pontos"
end

def dont_you_want_to_play?
  puts "\nDeseja jogar novamente? (S/N)"
  decision = gets.strip
  decision.upcase == 'N'
end

def main
  welcome

  loop do
    play
    break if dont_you_want_to_play?
  end
end

main
