class User < ApplicationRecord
    has_secure_password
    has_many :questions
    has_many :answers
    has_many :surveys
    has_many :participates
    has_many :responses
    
end
