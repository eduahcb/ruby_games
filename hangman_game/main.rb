require_relative 'business_logic'
require_relative 'ui'

def main
  welcome

  loop do
    play
    break if dont_you_want_to_play?
  end
end

main
