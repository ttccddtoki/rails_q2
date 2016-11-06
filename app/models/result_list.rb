class ResultList < ActiveRecord::Base
  has_many :results
  belongs_to :user
end
