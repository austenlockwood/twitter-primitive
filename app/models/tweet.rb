class Tweet < ActiveRecord::Base
  validates :body, length: {maximum: 170, too_long: "170 characters is the maximum allowed"}
  belongs_to :user
end
