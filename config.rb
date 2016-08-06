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

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = ENV['BUCKET_NAME'] # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'eu-west-1'     # The AWS region for your bucket.
  s3_sync.aws_access_key_id          = ENV['ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key      = ENV['SECRET_ACCESS_KEY']
  s3_sync.delete                     = true # We delete stray files by default.
  s3_sync.after_build                = false # We chain after the build step by default. This may not be your desired behavior…
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
end

activate :contentful do |f|
  f.space         = { contentful: ENV['CONTENTFUL_SPACE'] }
  f.access_token  = ENV['CONTENTFUL_ACCESS_TOKEN']
  f.rebuild_on_webhook = true
  #f.cda_query     = { content_type: ENV['CONTENTFUL_POST'], include: 1 }
  f.cda_query = { limit: 1000 }
  f.content_types = {partner: ENV['CONTENTFUL_PARTNERS'],
                      affiliated_company: ENV['CONTENTFUL_AFFILIATED_COMPANIES'],
                      misc: ENV['CONTENTFUL_MISC'], service: ENV['CONTENTFUL_SERVICES'],
                      testimonial: ENV['CONTENTFUL_TESTIMONIAL'], skill: ENV['CONTENTFUL_SKILL'], 
                      asset: ENV['CONTENTFUL_ASSET']}
end

# Pretty URLs (https://middlemanapp.com/advanced/pretty_urls/)
#activate :directory_indexes
#set :trailing_slash, false

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
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
