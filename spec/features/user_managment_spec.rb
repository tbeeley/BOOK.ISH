require 'spec_helper'

feature "User signs up" do

	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).from(0).to(1)
		expect(page).to have_content("Welcome, alice@example.com")
		expect(User.first.email).to eq("alice@example.com")
	end

	def sign_up(email = "alice@example.com",
				password = "oranges!")
		visit '/users/new'
		expect(page.status_code).to eq(200)
		# expect(page.status_code).to eq(200)
		fill_in :email, with: email
		fill_in :password, with: password
		click_button "Sign up"
	end

end