class Tweet
  require 'twitter'
  require 'net/http'
  
  def initialize
    config = YAML::load(open("#{RAILS_ROOT}/config/twitter.yml"))
    httpauth = Twitter::HTTPAuth.new(config['email'], config['password'])
    @base = Twitter::Base.new(httpauth)
  end
  
  def post_update(entry)
    # get the url for the entry
    entry_url = "http://#{DOMAIN_NAME}/entries/#{entry.id}"
    
    # shorten the url with is.gd
    short_url = Net::HTTP.get(URI.parse("http://is.gd/api.php?longurl=#{entry_url}"))
    
    # build the message to be posted
    message = "To: #{entry.to} #{short_url}"
    
    # post the update to Twitter
    @base.update(message)
  end
end