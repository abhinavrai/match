class Question < ActiveRecord::Base
  belongs_to :profile
  attr_accessible :correctAnswer, :optionA, :optionB, :optionC, :optionD, :title
end
