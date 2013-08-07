class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags do |t|
      t.integer :question_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
