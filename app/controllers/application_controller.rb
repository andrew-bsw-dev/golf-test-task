class ApplicationController < ActionController::Base
  def current_user
    # If test situation when user is logged in
    User.with_role('golfer').first

    # If test situation when user is not logged in
    # nil
  end
end
