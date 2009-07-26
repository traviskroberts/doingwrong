# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def default_image_url
    "http://#{request.host}/images/unknown.gif"
  end
end
