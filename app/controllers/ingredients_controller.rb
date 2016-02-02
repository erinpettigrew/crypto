class IngredientsController < ApplicationController
	  before_action :authenticate_user! #remove when out of preview beta
end
