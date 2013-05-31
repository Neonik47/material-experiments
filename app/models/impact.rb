# -*- encoding : utf-8 -*-
class Impact < ActiveRecord::Base
  has_many :experiments, :dependent => :destroy
  has_many :impacts_params, :dependent => :destroy
  accepts_nested_attributes_for :impacts_params, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :impacts_params, :reject_if => lambda { |a| a[:name].blank? || a[:unit].blank?}, :allow_destroy => true
end
