require 'pry'
require 'rspec'
require_relative 'letter'

describe Letter do
  let(:aletter) {Letter.new('b')}
  it 'accepts string as an argument' do
    expect(aletter.string).to eq('b')
  end
end
