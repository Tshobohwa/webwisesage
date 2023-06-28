require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Salomon') }

  before do
    subject.save
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be integer value' do
    subject.posts_count = 'not valid'
    expect(subject).to_not be_valid
  end

  it 'posts counter should be a number greater or equal to zero' do
    subject.posts_count = -1
    expect(subject).to_not be_valid
  end
end
