
class LettersController < ApplicationController
  def new
  end

  def index
    @letter = Letter.new
  end

  def create
    words = params.fetch("letter")["words"]
    letters_array = words.split("")
    letters_array.each do |letter|
      object = Letter.where(letter: letter).first_or_create!
      object.count += 1
      object.save
    end
  end
end