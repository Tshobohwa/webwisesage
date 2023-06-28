require 'rails_helper'

describe Post, type: :model do
  let(:user) { User.create(name: 'Tom') }

  subject { Post.new(title: 'Rails', text: 'Rails is magic', author: user) }
  before { subject.save }

  describe 'validations' do
    it 'validates presence of title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'validates maximum length of title' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'validates presence of text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'validates numericality of comments_counter' do
      subject.comments_counter = 'not a number'
      expect(subject).to_not be_valid
    end

    it 'validates comments_counter is greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'validates numericality of likes_counter' do
      subject.likes_counter = 'not a number'
      expect(subject).to_not be_valid
    end

    it 'validates likes_counter is greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
