# -*- encoding : utf-8 -*-
module ApplicationHelper
  def show_flash
    res=[]
    flash.each do |k,v|
      res<<content_tag(:div,v, :class => "flash_#{k}")
    end
    raw(res.join)
  end

  def link_to_icon(icon, text, *args)
    link_to(content_tag(:i, nil, :class => icon)+text, *args)
  end

  #def link_to_reset_cookie(experiment)
  #  cookies.delete :data
  #end

  def menu_items
    [{name: 'experiments', title: "Эксперименты"}, {name: 'nodes', title: "Структурное дерево"},
        {name: 'impacts', title: "Средства воздействия"}, {name: 'users', title: "Пользователи", admin: true}]
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
