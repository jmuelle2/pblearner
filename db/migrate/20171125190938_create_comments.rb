class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :response_id
      t.text :content
      t.integer :student_id
      t.integer :instructor_id

      t.timestamps

    end
  end
end
