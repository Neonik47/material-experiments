class Element < ActiveRecord::Base
  attr_accessible :atm, :atnum, :name, :sign

  has_many :element_experiments
  has_many :experiments,:through => :element_experiments, :source=>:experiment#, :dependent=>:destroy #не удаляет детей

end
