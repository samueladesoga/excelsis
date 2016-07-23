# Load .env file
Dotenv.load

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Test if contentful data exists


# if data.respond_to? :contentful
#   data.contentful.partner.each do |id, partner|
#     proxy "/partners/#{partner['slug']}.html", '/partner.html', locals: {partner: partner}
#   end

#   data.contentful.affiliated_company.each do |id, affiliated_company|
#     proxy "/affiliated_companies/#{affiliated_company['slug']}.html", '/affiliated_company.html', locals: {affiliated_company: affiliated_company}
#   end

#   data.contentful.misc.each do |id, misc|
#     proxy "/misc/#{misc['slug']}.html", '/misc.html', locals: {misc: misc}
#   end

#   data.contentful.service.each do |id, service|
#     proxy "/services/#{service['slug']}.html", '/service.html', locals: {service: service}
#   end

#   data.contentful.testimonial.each do |id, testimonial|
#     proxy "/testimonials/#{testimonial['slug']}.html", '/testimonial.html', locals: {testimonial: testimonial}
#   end
# end


# ignore '/partner.html'
# ignore '/affiliated_company.html'
# ignore '/misc.html'
# ignore '/service.html'
# ignore '/testimonial.html'

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :contentful do |f|
  f.space         = { contentful: ENV['CONTENTFUL_SPACE'] }
  f.access_token  = ENV['CONTENTFUL_ACCESS_TOKEN']
  #f.cda_query     = { content_type: ENV['CONTENTFUL_POST'], include: 1 }
  f.cda_query = { limit: 1000 }
  f.content_types = {partner: ENV['CONTENTFUL_PARTNERS'],
                      affiliated_company: ENV['CONTENTFUL_AFFILIATED_COMPANIES'],
                      misc: ENV['CONTENTFUL_MISC'], service: ENV['CONTENTFUL_SERVICES'],
                      testimonial: ENV['CONTENTFUL_TESTIMONIAL'], skill: ENV['CONTENTFUL_SKILL'] }
end

# Pretty URLs (https://middlemanapp.com/advanced/pretty_urls/)
activate :directory_indexes
set :trailing_slash, false

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
