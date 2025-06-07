class SubscriptionsController < ApplicationController
	def index
    	@subscriptions = Subcription.all
    end
end
