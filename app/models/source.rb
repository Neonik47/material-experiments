class Source < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :source_experiment, :class_name => 'Experiment'
end
