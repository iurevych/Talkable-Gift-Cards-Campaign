class InviteController < ApplicationController
  skip_before_action :load_talkable_offer # skip default trigger widget integration

  def purchase
    amount = params[:subtotal] || 15
    email = params[:email] ? params[:email] : 'si+gift-cards@talkable.com'

    @purchase = {
      email: email,
      order_number: rand(0..10000000),
      subtotal: amount,
      campaign_tags: 'default',
      custom_properties: {
        amount: amount
      }
    }

    Talkable::API::Origin.create(Talkable::API::Origin::PURCHASE, @purchase)
  end

  def show
    @email = params[:email] ? params[:email] : 'si+gift-cards@talkable.com'

    origin = Talkable.register_affiliate_member({
      email: @email
    })

    @invite_offer = origin.offer if origin
  end
end
