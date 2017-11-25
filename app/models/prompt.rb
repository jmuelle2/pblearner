class Prompt < ApplicationRecord
  # Direct associations

  has_many   :assigned_prompts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
