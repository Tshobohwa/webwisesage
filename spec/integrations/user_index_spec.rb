require 'rails_helper'

RSpec.describe 'User #Index Page', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Salomon Tshobowa', photo: 'https://salomon.jpg',
                         bio: 'Micronaute', posts_counter: 5)
    @user2 = User.create(name: 'Chere Lemma', photo: 'https://chere.jpg',
                         bio: 'Micraunote', posts_counter: 5)
    visit users_path
  end

  it 'It should show all the users names' do
    expect(page.html).to have_content(@user1.name)
    expect(page.html).to have_content(@user2.name)
  end

  it 'It should show the picture for each user.' do
    expect(page.html).to include(@user1.photo)
    expect(page.html).to include(@user2.photo)
  end

  it 'It should show the number of posts of each user.' do
    expect(page.html).to have_content(@user1.posts_counter)
    expect(page.html).to have_content(@user2.posts_counter)
  end

  it 'When I click on a user, It should redirect me to that users show page.' do
    click_on @user2.name
    expect(current_path).to eq("/users/#{@user2.id}")
  end
end
