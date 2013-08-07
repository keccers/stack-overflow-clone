class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.integer :question_id
      t.integer :responder_id
    end
  end
end
