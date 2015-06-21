require 'net/http'

class HeadlinesController < ApplicationController

  def index
    url = URI.parse('http://api.nytimes.com/svc/news/v3/content/all/u.s./.json?api-key=sample-key')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }
    @headlines = []
    if JSON.parse(res.body)['status'] == 'OK'
      JSON.parse(res.body)['results'].each do |element|
        @headlines << Headline.new(title: element['title'], abstract: element['abstract'], url: element['url'])
      end
    else
      @headlines << Headline.new(title: "There was an error getting your news.")
    end
    render :json => @headlines
  end
end