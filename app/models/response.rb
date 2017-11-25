class Response < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :assigned_prompt

  # Indirect associations

  # Validations

end
