module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def error_messages(object, field)   # ie: error_messages(@object, @object.field)
    if object.present?
      messages = object.errors["#{field}"].map { |msg| content_tag(:p, msg) }.join
      messages.gsub! "<p>", ""
      messages.gsub! "</p>", ""
      if messages.length > 0
        html = <<-HTML
        <ul class='unstyled'>
          <li class="text-error">
            <i class="icon-exclamation-sign"></i>
            #{messages}
          </li>
        </ul>
        HTML
        html.html_safe
      end
    end
  end

  def get_menu_tabs
    @upload_types = UploadType.find(:all)
  end

end
