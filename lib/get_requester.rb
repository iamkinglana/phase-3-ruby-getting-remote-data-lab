require 'json'
require 'net/http'
require 'uri'

class GetRequester
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def parse_json
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def get_response_body
    get_requester = JSON.parse(parse_json)
    get_requester.collect do |get_request|
      get_request["agency"]
    end
  end
end

api_url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json"
get_requester = GetRequester.new(api_url)
response_body = get_requester.get_response_body
puts response_body
