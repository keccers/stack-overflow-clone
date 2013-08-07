class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :text, null: false
      t.integer :asker_id, null: false
      t.integer :best_answer_id
      t.timestamps
    end
  end
end
