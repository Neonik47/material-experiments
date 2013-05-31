class ImpactsParam < ActiveRecord::Base
  belongs_to :impact
  has_many :experiments_impacts_params, :dependent => :destroy
end
