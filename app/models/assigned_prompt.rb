class AssignedPrompt < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :destroy

  belongs_to :prompt

  # Indirect associations

  # Validations

end
