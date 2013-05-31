class Node < ActiveRecord::Base
  has_ancestry
  has_many :experiments, :dependent => :destroy
end
