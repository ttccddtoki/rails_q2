class Result < ActiveRecord::Base
  belongs_to :result_list
  belongs_to :question
end
