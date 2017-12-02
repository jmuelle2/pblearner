class Prompt < ApplicationRecord
  # Direct associations

  belongs_to :admin,
             :class_name => "User",
             :foreign_key => "user_id"

  has_many   :assigned_prompts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
