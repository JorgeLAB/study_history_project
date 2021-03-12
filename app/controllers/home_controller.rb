class HomeController < ApplicationController
	def index
		@study_items = StudyItems.all 
	end
end