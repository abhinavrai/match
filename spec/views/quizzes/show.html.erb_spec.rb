require 'spec_helper'

describe "quizzes/show" do
  before(:each) do
    @quiz = assign(:quiz, stub_model(Quiz,
      :name => "Name",
      :description => "Description",
      :quiz_stream => "Quiz Stream",
      :no_of_questions => 1,
      :quiz_time => 2,
      :quiz_status => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Quiz Stream/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
