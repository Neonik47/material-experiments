# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base

  authenticates_with_sorcery!
  ROLES=%w(Пользователь Лаборант Преподаватель Модератор Администратор)
  STATUSES=["Не утвержден", "Утвержден", "Удален"]
  validates :name, :presence => true
  validates :surname, :presence => true
  validates :role, :presence => true, :inclusion => {:in => 0...ROLES.size}
  validates :status, :presence => true, :inclusion => {:in => 0...STATUSES.size}
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :username, :presence => true, :length => {:maximum => 100}
  validates :password, :presence => true, :length => {:minimum => 6}, :confirmation => true, :on => :create, :if => :present?

  has_many :experiments

  def human_role
    ROLES[role.to_i]
  end

  def human_status
    STATUSES[status.to_i]
  end

  def user?
    role==0
  end
  def assistant?
    role==1
  end
  def professor?
    role==2
  end
  def moderator?
    role==3
  end
  def admin?
    role==4
  end

  def active?
    status==1
  end

  def privilege?
    moderator? || admin?
  end
end
