class WordAnalysis

  class << self
    def word_count(file_path)
      f = File.open(file_path, "r")
      f.each_line do |line|
        words = line.split(' ')
        word_freq = Hash.new(0)
        words.each do |word|
          if /[^\za-zA-Z]/.match(word)
            word = /[\za-zA-Z]/.match(word)
            word_freq[word.to_s.downcase] += 1
          else
            word_freq[word.to_s.downcase] += 1
          end
        end
      end
      word_freq
    end
  end


  class << self
    def char_count(file_path)
      f = File.open(file_path, "r")
      f.each_line do |line|
        chars = line.split('')
        char_freq = Hash.new(0)
        chars.each do |char|
          if /[\S]/.match(char)
            char_freq[char.downcase] += 1
          end
        end
      end
      char_freq
    end
  end

  class << self
    def top_words(file_path)
      self.word_count(file_path).sort[0..2]
    end
  end

  class << self
    def top_letter(file_path)
      self.char_count(file_path).sort[0..2]
    end
  end
end


