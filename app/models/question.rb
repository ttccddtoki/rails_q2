class Question < ActiveRecord::Base
  has_many :choices, dependent: :destroy

  def self.order_by_ids(ids)
    order_by = ['case']
    ids.each_with_index.map do |id, index|
      order_by << "WHEN id='#{id}' THEN #{index}"
    end
    order(order_by.join(" "))

  end
end
