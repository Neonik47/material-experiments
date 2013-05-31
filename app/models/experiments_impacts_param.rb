class ExperimentsImpactsParam < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :impacts_param
end
