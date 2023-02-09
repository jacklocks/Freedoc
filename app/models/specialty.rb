class Specialty < ApplicationRecord
    has_many :doctors
    belongs_to :doctor
    belongs_to :specialty

end
