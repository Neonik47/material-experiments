# -*- encoding : utf-8 -*-
module ExperimentsHelper
  def get_value(id, arr)
    arr.each do |x|
      return x if x.impacts_param_id == id
    end
    return nil
  end

  def status(exp)
    return ["button","button blue","button red","button green"][exp.status]
  end

  def edit?(exp)
    if current_user.moderator?
      return 3
    elsif (exp.status == 1 and exp.confirmatory_id == current_user.id)
      return 2
    elsif (exp.status < 3 and (exp.owner_id == current_user.id or exp.confirmatory_id == current_user.id))
      return 1
    else
      return 0
    end
  end

  def to_compare_count
    c = cookies[:experiments]
    c.blank? ? 0 : c.split(";").size
  end

  def exp_list
    id_list = cookies[:experiments].split(";")
    e_list = Experiment.where(:id => id_list).where(:owner_id => current_user.id, :confirmatory_id => current_user.id).all
    #e_list = Experiment.where(:id => id_list).where("owner_id = ? OR confirmatory_id = ?",current_user.id,current_user.id).all
    return e_list
  end

  def short(pdf)
    label = pdf.split("\/").last
    if label.size > 10
      label = label[0..6]+"..."+label[-3..-1]
    end
    return label
  end

end
