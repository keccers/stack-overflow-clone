class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :asker_id
      t.integer :best_answer_id
    end
  end
end
