require 'rails_helper'

describe "the add an image path" do
  it "will allow an authenticated user to add image" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_link 'Login'
    fill_in 'Email', :with => 'user@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    click_link 'Add a image'
    attach_file "Image", "public/images/thumb/missing.jpeg"
    fill_in 'Email', :with => 'user@email.com'
    click_on "Create Image"
    expect(page).to have_content("user@email.com image Page")
  end

  it "gives error when no image is attached" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_link 'Login'
    fill_in 'Description', :with => 'user@email.com'
    fill_in 'Password', :with => '123456'
    click_on 'Log in'
    click_link 'Add a image'
    click_on "Create Image"
    expect(page).to have_content("Image failed to save")
  end
end
