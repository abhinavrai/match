require 'spec_helper'

describe "quizzes/index" do
  before(:each) do
    assign(:quizzes, [
      stub_model(Quiz,
        :name => "Name",
        :description => "Description",
        :quiz_stream => "Quiz Stream",
        :no_of_questions => 1,
        :quiz_time => 2,
        :quiz_status => false
      ),
      stub_model(Quiz,
        :name => "Name",
        :description => "Description",
        :quiz_stream => "Quiz Stream",
        :no_of_questions => 1,
        :quiz_time => 2,
        :quiz_status => false
      )
    ])
  end

  it "renders a list of quizzes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Quiz Stream".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
