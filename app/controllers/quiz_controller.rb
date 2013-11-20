class QuizController < ApplicationController
	def index
		if request.xhr?
			@quiz = Quiz.find(params[:quizId])
		end
	end

	def ajax
		if request.xhr?
				@quiz = Quiz.find(params[:quizId])
				@profiles = Profile.all
				@questionIds = Array.new

			if session[:index] == nil
				@profiles = Profile.order(id: :asc).limit(@quiz.no_of_questions).shuffle
				@profiles.each do |p|
					@questionIds.push(p.id)
				end


				session[:quizId] = @quiz.id
				session[:questionIds] = @questionIds
				session[:index] = 0
			end
			questionIds = session[:questionIds]
		end
			profiles = @profiles
			@profile = Profile.find(questionIds[session[:index]])
			@question = self.fetch_question(questionIds[session[:index]], profiles)
	end

	def question
		if request.xhr?
				@quiz = Quiz.find(params[:quizId])
				@profiles = Profile.all
				@questionIds = Array.new

			if session[:index] == nil
				@profiles = Profile.order(id: :asc).limit(@quiz.no_of_questions).shuffle
				@profiles.each do |p|
					@questionIds.push(p.id)
				end


				session[:quizId] = @quiz.id
				session[:questionIds] = @questionIds
				session[:index] = 0
			end
			questionIds = session[:questionIds]
		end
			profiles = @profiles
			@profile = Profile.find(questionIds[session[:index]])
			@question = self.fetch_question(questionIds[session[:index]], profiles)
	end

	protected

	def fetch_question(ques_id, profiles)
		@quiz = Quiz.find(session[:quizId])
		@profile = Profile.find(ques_id)
		@profiles = profiles
		@question = Question.new
		optionA, optionB, optionC, optionD = nil
			if @profiles.count > 3

				answerRandom = rand(1..4)
				optionRandom = self.n_randoms(4, 4)
				if answerRandom == 1
					optionA = @profile.name
					optionB = @profiles[rand(0...@quiz.no_of_questions)].name
					optionC = @profiles[rand(0...@quiz.no_of_questions)].name
					optionD = @profiles[rand(0...@quiz.no_of_questions)].name
				elsif answerRandom == 2
					optionA = @profiles[rand(0...@quiz.no_of_questions)].name
					optionB = @profile.name
					optionC = @profiles[rand(0...@quiz.no_of_questions)].name
					optionD = @profiles[rand(0...@quiz.no_of_questions)].name
				elsif answerRandom == 3
					optionD = @profiles[rand(0...@quiz.no_of_questions)].name
					optionB = @profiles[rand(0...@quiz.no_of_questions)].name
					optionC = @profile.name
					optionD = @profiles[rand(0...@quiz.no_of_questions)].name
				else
					optionA = @profiles[rand(0...@quiz.no_of_questions)].name
					optionB = @profiles[rand(0...@quiz.no_of_questions)].name
					optionC = @profiles[rand(0...@quiz.no_of_questions)].name
					optionD = @profile.name
				end
		end
		@question.optionA = optionA
		@question.optionB = optionB
		@question.optionC = optionC
		@question.optionD = optionD
		@question.correctAnswer = @profile.name
		return @question
	end

	def n_randoms(n, max)
		r = []
		numbers = n
		maximum = max
		while r.length < numbers
			v = rand(1..maximum)
			r << v unless r.include? v
		end
		return r
	end
end