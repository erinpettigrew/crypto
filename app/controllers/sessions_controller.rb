class SessionsController < Devise::SessionsController
  before_action :disable_nav, only: [:new]
  before_action :disable_footer, only: [:new]

  def new
    super
  end
end
