module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Recipes App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # Returns the logo for the header
  def logo
    image_tag("recipes.jpg", :alt => "Sample App", :class => "round")
  end
end
