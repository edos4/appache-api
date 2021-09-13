class Wolf < ApplicationRecord
    has_many :leads
    has_many :wolves_comissions
    has_one :staff
end
