require 'yaml'
require 'open-uri'
require 'uri'
require 'json'
require 'ap'

CONFIG = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + '/config.yml')

def fetch(site)
  if site['type'] == 'tumblr'
    host = URI.parse(site['url']).host
    api_url = "http://api.tumblr.com/v2/blog/#{host}/posts?api_key=#{CONFIG['api_keys']['tumblr']}&notes_info=false"
    posts = JSON.parse(open(api_url).read)['response']['posts']

    posts.each do |post|
      if post['photos']
        photo = post['photos'][0]['original_size']
        
        if photo['width'] > 1000
          save(photo['url'])
        end
      end
    end
  else
    ap 'Sorry, your site type is not supported.'
  end
end

def save(url)
  filename = File.basename(URI.parse(url).path)
  save_path = CONFIG["path"] + filename

  unless File.exists? save_path
    image = open(url).read
    File.open(save_path, 'w') { |file| file.write(image) }
    ap "Success: #{filename}"
  else
    ap "Error: #{filename} already exists."
  end
end

def init
  if File.exists? CONFIG["path"]
    CONFIG["sites"].each do |site|
      fetch(site)
    end
  else
    ap "Your path does not exist. Try again."
  end
end

ap "//////////////////////"
ap "Running at #{Time.now.strftime('%m/%d/%Y %H:%M')}"
ap "//////////////////////"

init()

ap "//////////////////////"
ap "Done."
ap "//////////////////////"