class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'cyborg'
  client = Octokit::Client.new \
    :login    => 'Rhadax',
    :password => 'marseille13'

  user = client.user
  user.login
end
