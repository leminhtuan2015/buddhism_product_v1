class LectureStore < ActiveRecord::Base
  has_many :lectures, :dependent => :destroy
end
