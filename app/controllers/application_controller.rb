class ApplicationController < ActionController::Base
  before_action :set_total_pledged

  private

    def set_total_pledged
      @total_pledged = Player.sum(:donation)
    end
end
