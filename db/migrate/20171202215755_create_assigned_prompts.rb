class CreateAssignedPrompts < ActiveRecord::Migration
  def change
    create_table :assigned_prompts do |t|
      t.integer :prompt_id
      t.integer :student_id

      t.timestamps

    end
  end
end
