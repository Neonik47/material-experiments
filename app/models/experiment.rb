# -*- encoding : utf-8 -*-
class Experiment < ActiveRecord::Base

  before_destroy :delete_children


  belongs_to :owner, :class_name => 'User'
  belongs_to :confirmatory, :class_name => 'User'
  belongs_to :impact
  belongs_to :node



  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  #attr_accessor :fimages
  attr_accessor :images_attributes

  has_many :sources, :dependent => :destroy
  has_many :source_experiments,:through=> :sources, :source=>:source_experiment#:experiment

  has_many :child_experiments,:through=> :child_sources, :source=>:experiment#, :dependent=>:destroy #не удаляет детей
  has_many :child_sources, :class_name => 'Source', :foreign_key => :source_experiment_id, :dependent => :destroy

  has_many :experiments_impacts_params, :dependent => :destroy

  has_many :element_experiments
  has_many :elements,:through => :element_experiments, :source=>:element

  #accepts_nested_attributes_for :source_experiments, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :sources, :allow_destroy => true

  accepts_nested_attributes_for :element_experiments, :allow_destroy => true
  accepts_nested_attributes_for :experiments_impacts_params, :allow_destroy => true


  STATUSES=["Черновик", "На проверке", "На доработке", "Подтвержден"]
  def human_status
    STATUSES[(status.to_i)%(STATUSES.size)]
  end

  def deleted?
    (status.to_i/10 > 0) ? true : false
  end

  private
  def delete_children
    self.child_experiments.each(&:destroy)
  end


end