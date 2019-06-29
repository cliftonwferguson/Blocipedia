class ChargesController < ApplicationController

def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user}",
     amount: 10_00
   }
 end

end
