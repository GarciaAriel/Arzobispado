class CreateAnswerUsers < ActiveRecord::Migration
  def change
    create_table :answer_users do |t|
      t.boolean :response
      t.integer :usuario_id
      t.integer :survey_id
      t.integer :question_id
      t.integer :answer_id
      t.timestamps
    end

    add_attachment :answer_users, :archivo
  end
end
