require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:name) {RandomData.random_sentence}
  let(:description) {RandomData.random_paragraph}
  let(:title) {RandomData.random_sentence}
  let(:body) {RandomData.random_paragraph}

  #this allows us to create a parent topic for post
  let(:topic) {Topic.create!(name:name, description:description)}

  #this allows us to associate post with topic via topic.posts.create!
  let(:post) { topic.posts.create!(title: title, body: body )}

  it { is_expected.to belong_to(:topic)}


  # this test whether post has attributes named title and body. This test
  # whether post will return a non-nil value when post.title and post.body is called
  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: title, body: body)
    end
  end
end
