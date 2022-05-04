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
    raw Pygments.highlight(code, options: {encoding: 'utf-8'})
  end

  def format_code_css(css_class, style:)
    Pygments.css(css_class, style: style)
  end
end
