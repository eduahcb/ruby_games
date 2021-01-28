def read_rank
  content = File.read 'rank.txt'
  content.strip.split "\n"
end

def save_rank(name, points)
  content = "#{name}\n#{points}"
  File.write 'rank.txt', content
end
