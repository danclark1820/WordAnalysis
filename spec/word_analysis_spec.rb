require 'pry'
require 'rspec'
require_relative '../word_analysis'

char_freq = Hash.new(0)
word_freq = Hash.new(0)
describe WordAnalysis do
  context 'Working with files' do
    f = File.open('fixtures/sample.txt', "r")
    f.each_line do |line|
      words = line.split(' ')
      chars = line.split('')
      words.each do |word|
        if /[^\za-zA-Z]/.match(word)
          word = /[\za-zA-Z]/.match(word)
          word_freq[word.to_s.downcase] += 1
        else
          word_freq[word.to_s.downcase] += 1
        end
      end

      chars.each do |char|
        if /[\S]/.match(char)
          char_freq[char.downcase] += 1
        end
      end
      char_freq
      word_freq
    end

    # it 'reads a file' do
    #   expect WordAnalysis.read_file('fixtures/sample.txt').should eq(f.gets)
    # end

    it "counts the words in a file" do
      expect WordAnalysis.word_count('fixtures/sample.txt').should eq(word_freq)
    end

    it "counts the letters in a file" do
      expect WordAnalysis.char_count('fixtures/sample.txt').should eq(char_freq)
    end

    it "gives the top three words" do
      expect WordAnalysis.top_words('fixtures/sample.txt').to eq(word_freq.sort[0..2])
    end

    it "gives the top three chars" do
      expect WordAnalysis.top_letter('fixtures/sample.txt').to eq(char_freq.sort[0..2])
    end
  end
end
