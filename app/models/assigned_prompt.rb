class AssignedPrompt < ApplicationRecord
  # Direct associations

  belongs_to :student

  belongs_to :prompt

  # Indirect associations

  # Validations

end
