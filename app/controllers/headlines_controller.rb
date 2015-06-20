require 'net/http'

class HeadlinesController < ApplicationController

  def index
    url = URI.parse('http://api.nytimes.com/svc/news/v3/content/all/u.s./.json?api-key=sample-key')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }
    render :json => res.body
  end
end