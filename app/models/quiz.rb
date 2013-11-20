class Quiz < ActiveRecord::Base
  attr_accessible :description, :name, :no_of_questions, :quiz_status, :quiz_stream, :quiz_time
end
