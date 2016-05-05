require_relative '../rails_helper'

describe CommentsController, type: :controller do

  before do
    @person = FactoryGirl.create(:person)
  end

  it "should delete a comment" do
    @comment = FactoryGirl.create(:comment, person: @person)
    post :destroy, {id: @comment.id}, {logged_in_id: @person.id}
    expect(response).to be_redirect
    expect { @comment.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "should not delete a comment unless user is owner or admin" do
    @comment = FactoryGirl.create(:comment, person: @person)
    @other_person = FactoryGirl.create(:person)
    post :destroy, {id: @comment.id}, {logged_in_id: @other_person.id}
    expect(response).to be_unauthorized
  end

end
