class User < ApplicationRecord
    has_many :reimbursements

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
end
