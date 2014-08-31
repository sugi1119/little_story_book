class DashboardController < ApplicationController
  before_filter :authenticate_author!
  def index
  end
end
