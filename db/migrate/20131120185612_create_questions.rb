class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, :limit => 1024
      t.string :optionA, :limit => 255
      t.string :optionB, :limit => 255
      t.string :optionC, :limit => 255
      t.string :optionD, :limit => 255
      t.string :correctAnswer, :limit => 255

      t.timestamps
    end
  end
end
