Dotenv.load
I18n.default_locale = :ru
Time.zone = "Moscow"

activate :blog do |blog|
  blog.prefix = ""
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.taglink = "tags/:tag.html"

  blog.layout = "layout"

  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"
  blog.day_link = ":year/:month/:day.html"

  blog.default_extension = ".md"

  # blog.calendar_template = "calendar.html"
  blog.tag_template = "tag.html"

  blog.paginate = false
end

page "/feed.xml", layout: false

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.method = :git
end
