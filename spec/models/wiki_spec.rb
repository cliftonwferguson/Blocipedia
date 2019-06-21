require 'rails_helper'

RSpec.describe Wiki, type: :model do
 
 let(:user) {User.create!(email: "email@string.com", password: "password string")}


 let(:wiki) {Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: "true", user: user)}
 
 describe "attributes" do
 	it "has title, body, private, and user attributes" do
 	  expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: true, user_id: user.id)
  end
 end
end 

