module ApplicationHelper
  def embedded_svg(filename, options = {})
    assets = Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)
    file = assets.find_asset("svg/" + filename + ".svg").source.force_encoding("UTF-8")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css "svg"
    if options[:class].present?
      svg["class"] = options[:class]
    end
    raw doc
  end
  
  def active_link_class(link_path)
    params[:controller] == link_path ? "active" : ""
  end
end
