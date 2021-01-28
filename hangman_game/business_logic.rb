require_relative 'ui'

def choosing_a_secret_word
  show_choosing_a_secret_word_message
  text = File.read('dictionary.txt')
  all_words = text.split "\n"
  choosed_number = rand(all_words.size)
  secret_word = all_words[choosed_number].downcase
  show_choosed_secreat_word secret_word
  secret_word
end

def asking_for_a_valid_kick(kicks, errors, mask)
  show_header errors, kicks, mask

  loop do
    kick = asking_for_a_word_or_letter

    return kick unless kicks.include? kick

    you_already_kicked kick
  end
end

def maskered_workd(kicks, secret_word)
  mask = ''
  secret_word.chars.each do |letter|
    mask += if kicks.include? letter
              letter
            else
              '_'
            end
  end
  mask
end

def play
  secret_word = choosing_a_secret_word

  errors = 0
  kicks = []
  points_sor_far = 0

  while errors < 5
    mask = maskered_workd kicks, secret_word
    kick = asking_for_a_valid_kick(kicks, errors, mask)
    kicks << kick

    is_a_letter = kick.size == 1
    if is_a_letter
      total_found = secret_word.count(kick)

      if total_found.zero?
        letter_not_found
        errors += 1
      else
        letter_found total_found
      end
    else
      hit = kick == secret_word
      if hit
        congratulations
        points_sor_far += 100
        break
      else
        you_missed
        points_sor_far -= 30
      end
    end
  end
  you_won points_sor_far
  points_sor_far
end
