class InviteController < ApplicationController
  skip_before_action :load_talkable_offer # skip default trigger widget integration

  def purchase
    amount = params[:subtotal] || 15
    @purchase = {
      email: params[:email] || 'si+gift-cards@talkable.com',
      order_number: rand(0..10000000),
      subtotal: amount,
      campaign_tags: 'default',
      custom_properties: {
        amount: amount
      }
    }

    # Talkable::API::Origin.create(Talkable::API::Origin::PURCHASE, @purchase)
  end

  def show
    # Make sure you have configured Campaign Placements at Talkable site
    # or explicitly specify campaign tags
    # origin = Talkable.register_affiliate_member(campaign_tags: 'invite')
    origin = Talkable.register_affiliate_member({
      email: params[:email] || 'si+gift-cards@talkable.com',
      custom_properties: {
        amount: 0
      }
    })
    @invite_offer = origin.offer if origin
  end
end
