class Lecture < ActiveRecord::Base
  belongs_to :lecture_store
  has_many :newfeeds, :dependent => :destroy
end
