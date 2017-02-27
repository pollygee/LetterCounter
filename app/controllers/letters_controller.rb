
class LettersController < ApplicationController
  def new
  end

  def index
    @letter = Letter.new
    @letters = Letter.all
    @total_letter_count = Letter.all.map(&:count).sum
  end

  def create
    words = params.fetch("letter")["words"]
    letters_array = words.split("")
    ingorable_letters = [" ", "'", '"', ",", "!", ".", "'"]
    letters_array.each do |letter|
      next if ingorable_letters.include? letter
      object = Letter.where(letter: letter.upcase).first_or_create!
      object.count += 1
      object.save
    end

    redirect_to letters_path
  end
end