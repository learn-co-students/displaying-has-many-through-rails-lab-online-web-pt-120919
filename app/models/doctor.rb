class Doctor < ApplicationRecord
    has_many :appointments
    has many :patients, through: :appointments
end
