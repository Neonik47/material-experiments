# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :check_auth, :except => [:new, :create]



  def index
    @users=User.order(:id).all
  end

  def edit
    @user=current_user
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(params[:user])
    @user.role=0
    if @user.save
      redirect_to users_path, :notice => "Регистрация прошла успешно!"
    else
      render 'new'
    end
  end

end
