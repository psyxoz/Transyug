# encoding : utf-8
module ApplicationHelper
  def active_class(text)
    "active" if text.include?(controller.controller_name) || (@active_page && @active_page.include?(text))
  end

  def format_date(date)
    date.strftime('%F')
  end

  def link_to_back(url = js_back_url)
    link_to raw("<i class='icon-chevron-left'></i> Назад"), url, :class => 'btn', :style => 'float: right;'
  end

  def js_back_url
    'javascript:window.history.go(-1);'
  end

  def link_to_remove_fields(name, form)
    form.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", :class => 'btn btn-danger btn-mini')
  end

  def link_to_add_fields(name, form, association, alias_association=nil, path='', lang='ru', style='margin-top: 5px;')
    new_object = form.object.class.reflect_on_association(association).klass.new
    fields = form.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(path + (alias_association || association).to_s.singularize + "_fields", :f => builder, :lang => lang)
    end
    link_to_function(name, "add_fields(this, '#{association}','#{escape_javascript(fields)}')", :class => 'btn btn-info btn-mini', :style => style)
  end

  def show_translate(model, method)
    return nil if model.nil?
    value = model.read_attribute("#{method}_#{I18n.locale}")
    if value.blank? || value.nil?
      model.read_attribute("#{method}_#{I18n.default_locale}")
    else
      value
    end
  end

  def menu_active?(code)
    @active_menus.include?(code.to_s)
  end
end
