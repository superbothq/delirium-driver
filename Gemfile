source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in delirium-driver.gemspec
gemspec

unless ENV['DELIRIUM_USE_RUBYGEMS'] == "yes"
  gem "delirium", path: "../delirium"
end
