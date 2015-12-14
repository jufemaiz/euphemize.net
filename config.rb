# Ignore Build
ignore '/buildkite/*'

# Pretty indexing
activate :directory_indexes

# Sitemap
page "/blog/feed.xml", layout: false

# Set the url_root
case ENV['BUILDKITE_BRANCH']
when 'staging'
  set :url_root, "https://#{ENV['BUILDKITE_BRANCH']}.euphemize.net"
when 'master'
  set :url_root, "https://euphemize.net"
else
  set :url_root, "http://localhost:4567"
end


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

# Site Settings
@analytics_account = false
@typekit_account = false

# Blog
activate :blog do |blog|
  # set options on blog
  blog.name               = 'blog'
  blog.sources            = '{year}-{month}-{day}-{title}'
  blog.prefix             = "blog"
  blog.permalink          = "{year}/{title}"
  blog.layout             = "blog_layout"
  blog.paginate           = true
  blog.page_link          = "p{num}"
  blog.per_page           = 20
  blog.tag_template       = "blog/tag.html"
  blog.calendar_template  = "blog/calendar.html"
  blog.summary_separator  = /READMORE/
end
Time.zone = "Sydney"

# Case Studies
activate :blog do |blog|
  # set options for case studies
  blog.name         = 'case-studies'
  blog.sources      = '{year}-{month}-{day}-{title}'
  blog.prefix       = 'case-studies'
  blog.permalink    = '{title}'
  blog.layout       = 'case_studies_layout'
  blog.paginate     = false
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
require "sanitize"
helpers do
   # Strip all HTML tags from string
  def strip_tags(html)
    Sanitize.clean(html.strip).strip
  end
end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload do |livereload|
    livereload.host = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
  end
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Gzip
activate :gzip

# Asset Settings
set :css_dir,     'assets/stylesheets'
set :js_dir,      'assets/javascripts'
set :images_dir,  'assets/images'
set :fonts_dir,   'assets/fonts'

# Setup Markdown
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :with_toc_data => true, :footnotes => true, :smartypants => true
set :markdown_engine, :kramdown

# Use HAML
set :haml, { :ugly => true, :format => :html5 }

# Add bower's directory to sprockets asset path
# after_configuration do
#   @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
#   sprockets.append_path File.join "#{root}", @bower_config["directory"]
# end

# Build-specific configuration
configure :build do

  # Minify HTML
  # TODO work out how to only do this in build...
  activate :minify_html do |html|
    html.remove_multi_spaces        = true   # Remove multiple spaces
    html.remove_comments            = true   # Remove comments
    html.remove_intertag_spaces     = false  # Remove inter-tag spaces
    html.remove_quotes              = true   # Remove quotes
    html.simple_doctype             = false  # Use simple doctype
    html.remove_script_attributes   = false  # Remove script attributes
    html.remove_style_attributes    = false  # Remove style attributes
    html.remove_link_attributes     = false  # Remove link attributes
    html.remove_form_attributes     = false  # Remove form attributes
    html.remove_input_attributes    = false  # Remove input attributes
    html.remove_javascript_protocol = true   # Remove JS protocol
    html.remove_http_protocol       = false  # Remove HTTP protocol
    html.remove_https_protocol      = false  # Remove HTTPS protocol
    html.preserve_line_breaks       = false  # Preserve line breaks
    html.simple_boolean_attributes  = true   # Use simple boolean attributes
    html.preserve_patterns          = nil    # Patterns to preserve
  end

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # TODO: Update to use Favicon builder. Requires the Build server to have ImageMagick installed
  # Create favicon/touch icon set from source/favicon_base.png
  # activate :favicon_maker, icons: {
  #   "_favicon_template.png" => [
  #     { icon: "apple-touch-icon-152x152-precomposed.png" },
  #     { icon: "apple-touch-icon-114x114-precomposed.png" },
  #     { icon: "apple-touch-icon-72x72-precomposed.png" },
  #   ]
  # }

  # FlowType
  # activate :FlowType

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Various Images
helpers do
  def blog_image_path(image)
    Find.find(File.join('source', 'blog'))
      .grep(/#{image}/)
      .first.to_s[%r{/blog/.+}].to_s
  end
end


# AWS DEPLOYMENT YO!
# Configuration variables specific to each project
#------------------------------------------------------------------------
BRANCH = ENV['BUILDKITE_BRANCH'].nil? ? 'staging' : ENV['BUILDKITE_BRANCH']
AWS_BUCKET                            = [BRANCH.downcase,'euphemize.net'].compact.join('.')
AWS_REGION                            = 'ap-southeast-2'
AWS_CLOUDFRONT_DISTRIBUTION_ID        = ENV["AWS_CLOUDFRONT_DISTRIBUTION_ID"]

# Variables: Sent in on CLI by rake task via ENV
#------------------------------------------------------------------------
# We deploy using our Buildkite EC2 instance so don't need this
# AWS_ACCESS_KEY                        = ENV['AWS_ACCESS_KEY']
# AWS_SECRET                            = ENV['AWS_SECRET']

# https://github.com/fredjean/middleman-s3_sync
activate :s3_sync do |s3_sync|
  s3_sync.bucket                      = AWS_BUCKET # The name of the S3 bucket you are targeting. This is globally unique.
  # s3_sync.aws_access_key_id           = AWS_ACCESS_KEY
  # s3_sync.aws_secret_access_key       = AWS_SECRET
  s3_sync.region                      = AWS_REGION
  s3_sync.delete                      = true # We delete stray files by default.
  s3_sync.prefer_gzip                 = true
  s3_sync.path_style                  = true
  s3_sync.reduced_redundancy_storage  = false
  s3_sync.acl                         = 'public-read'
  s3_sync.encryption                  = false
  s3_sync.prefix                      = ''
  s3_sync.version_bucket              = false
end
# default_caching_policy max_age:(60 * 60 * 24 * 31)

# https://github.com/andrusha/middleman-cloudfront
activate :cloudfront do |cf|
  # cf.access_key_id                    = AWS_ACCESS_KEY
  # cf.secret_access_key                = AWS_SECRET
  cf.distribution_id                  = AWS_CLOUDFRONT_DISTRIBUTION_ID
  # cf.filter = /\.html$/i
end

# after_s3_sync do |files_by_status|
#   puts "CloudFront: Invalidating files by updated status"
#   invalidate files_by_status[:updated]
#   puts "CloudFront: Invalidation complete"
# end
