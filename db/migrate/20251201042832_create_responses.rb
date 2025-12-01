class CreateResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :responses do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.text :user_answer
      t.boolean :is_correct

      t.timestamps
    end
  end
end
