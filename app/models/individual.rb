class Individual < ApplicationRecord
  has_and_belongs_to_many(:projects)
  belongs_to(:division)
end
