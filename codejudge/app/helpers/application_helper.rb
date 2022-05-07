module ApplicationHelper
  def embedded_svg(filename, options = {})
    assets = Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)
    file = assets.find_asset("svg/" + filename + ".svg")
    unless file.nil?
      file = file.source.force_encoding("UTF-8")
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css "svg"
      if options[:class].present?
        svg["class"] = options[:class]
      end
      raw doc
    end
  end
  
  def active_link_class(link_path)
    params[:controller] == link_path ? "active" : ""
  end

  def format_code(code, language)
    raw Pygments.highlight(code, lexer: language, options: {encoding: 'utf-8', linenos: true})
  end

  def format_code_css(css_class, style:)
    Pygments.css(css_class, style: style)
  end

  def link_delete_modal_tag(content, item_to_delete, item_description, options={})
    delete_button = link_to("Delete", item_to_delete, method: :delete, :class => "button button--delete")
    onclick = "Modal.show('Delete #{item_description}', 'Are you sure you want to delete this #{item_description.downcase}?', ['#{delete_button}'])"
    content_tag(:a, content, class: options[:class], onclick: "#{onclick}")
  end

  def button_delete_modal_tag(content, item_to_delete, item_description, options={})
    delete_button = button_to("Delete", item_to_delete, method: :delete, :class => "button button--delete")
    onclick = "Modal.show('Delete #{item_description}', 'Are you sure you want to delete this #{item_description.downcase}?', ['#{delete_button}'])"
    content_tag(:button, content, class: options[:class], onclick: "#{onclick}")
  end
end
