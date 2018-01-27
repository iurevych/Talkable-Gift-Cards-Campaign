class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :load_talkable_offer

  protected

  def load_talkable_offer
    origin = Talkable.register_affiliate_member
    @offer ||= origin.offer if origin
  end
end
