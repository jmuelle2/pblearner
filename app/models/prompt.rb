class Prompt < ApplicationRecord
  # Direct associations

  belongs_to :admin,
             :class_name => "Instructor",
             :foreign_key => "instructor_id"

  has_many   :assigned_prompts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
