class ChargesController < ApplicationController

def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium membership - #{current_user}",
     amount: 10_00
   }
 end

def create
   
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   
   charge = Stripe::Charge.create(
     customer: customer.id, 
     amount: 10_00,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
 
   flash[:notice] = "Thanks for upgrading, #{current_user.email}! Enjoy the premium content."
   redirect_to user_path(current_user) # or wherever
 
   
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

   after_action do
     current_user.role == :premium
   end
end
