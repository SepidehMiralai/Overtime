require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(email: "sara@test.com", password: "123456", password_confirmation: "123456", first_name: "Sara", last_name: "Shajari")
    login_as(user, :scope => :user)
  end
  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has the title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationale: "Post1")
      post2 = Post.create(date: Date.today, rationale: "Post2")
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end

  end

  describe "creation" do
    before do
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

end