class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.text :description, :limit => 1024
      t.string :quiz_stream, :limit => 256
      t.integer :no_of_questions, :limit => 4
      t.integer :quiz_time
      t.boolean :quiz_status

      t.timestamps
    end
  end
end
