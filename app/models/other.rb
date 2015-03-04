class Other < ActiveRecord::Base
  has_many :other_items, :dependent => :destroy
end
