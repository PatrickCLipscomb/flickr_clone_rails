require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit "/"
    click_link 'Sign Up'
    fill_in 'Email', :with => 'Home@stuff.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome!'
  end

  it "gives error when no email is entered" do
    visit "/"
    click_link 'Sign Up'
    click_on 'Sign up'
    expect(page).to have_content "Email can't be blank"
  end
end
