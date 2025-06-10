class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
      redirect_to root_path, notice: "Subscription created successfully!"
    else
      flash.now[:alert] = "Failed to create subscription."
      render :new
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:plan_type, :price, :start_date, :end_date)
  end
end
