require 'rails_helper'

describe 'navigate' do
  # before do
  #   # @user = User.create(email: "sara@test.com", password: "123456", password_confirmation: "123456", first_name: "Sara", last_name: "Shajari")
  #   # @user = FactoryBot.create(:user)
  #   # login_as(@user, :scope => :user)
  # end
  describe 'index' do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
      login_as(user, :scope => :user)
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has the title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = FactoryBot.build_stubbed(:post)
      post2 = FactoryBot.build_stubbed(:second_post)

      visit posts_path
      expect(page).to have_content(/Rational|content/)
    end

  end

  describe "creation" do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
      login_as(user, :scope => :user)
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "some rationale"
      click_on "Save"

      expect(page).to have_content(/some rationale/)
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("user association")

    end
  end

  describe "edit" do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
      login_as(user, :scope => :user)
      
    end

    it "can be reached by clicking edit link on index page" do 
      post = FactoryBot.create(:post)
      visit posts_path
      click_link "edit_#{post.id}"
      expect(page.status_code).to eq(200)
    end

    it "can be edited" do
      post = FactoryBot.create(:post)
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "edited content"
      click_on "Save"

      expect(page).to have_content(/edited content/)
    end

  end

end