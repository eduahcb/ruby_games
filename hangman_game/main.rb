require_relative 'business_logic'
require_relative 'ui'
require_relative 'rank'

def main
  name = welcome
  points = 0

  show_last_champion read_rank if read_rank[0] != ''

  loop do
    points += play
    show_total_points points
    save_rank name, points if read_rank[1].to_i < points
    break if dont_you_want_to_play?
  end
end

main
