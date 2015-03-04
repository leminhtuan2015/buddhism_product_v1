class RuleStore < ActiveRecord::Base
  has_many :rules, :dependent => :destroy
end
