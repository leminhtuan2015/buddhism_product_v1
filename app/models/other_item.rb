class OtherItem < ActiveRecord::Base
  has_many :other_item_details, :dependent => :destroy
  belongs_to :other
end
