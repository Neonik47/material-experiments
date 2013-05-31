class ElementExperiment < ActiveRecord::Base
  belongs_to :element
  belongs_to :experiment
  # attr_accessible :title, :body
end
