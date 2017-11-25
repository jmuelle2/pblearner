class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.text :content
      t.integer :instructor_id

      t.timestamps

    end
  end
end
