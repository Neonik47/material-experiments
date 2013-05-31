class Image < ActiveRecord::Base
  belongs_to :experiment#, :polymorphic => true

  has_attached_file :img,:styles => { :large => "800x800", :medium => "400x400>", :small => "200x200>" }



  validates_attachment_presence :img
  validates_attachment_size :img, :less_than => 5.megabytes
  validates_attachment_content_type :img, :content_type => ['image/jpeg', 'image/png']

  #attr_accessor :img, :img_file_name #WORK
  attr_accessible :img, :img_file_name

end
