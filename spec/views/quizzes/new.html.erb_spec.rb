require 'spec_helper'

describe "quizzes/new" do
  before(:each) do
    assign(:quiz, stub_model(Quiz,
      :name => "MyString",
      :description => "MyString",
      :quiz_stream => "MyString",
      :no_of_questions => 1,
      :quiz_time => 1,
      :quiz_status => false
    ).as_new_record)
  end

  it "renders new quiz form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quizzes_path, "post" do
      assert_select "input#quiz_name[name=?]", "quiz[name]"
      assert_select "input#quiz_description[name=?]", "quiz[description]"
      assert_select "input#quiz_quiz_stream[name=?]", "quiz[quiz_stream]"
      assert_select "input#quiz_no_of_questions[name=?]", "quiz[no_of_questions]"
      assert_select "input#quiz_quiz_time[name=?]", "quiz[quiz_time]"
      assert_select "input#quiz_quiz_status[name=?]", "quiz[quiz_status]"
    end
  end
end
