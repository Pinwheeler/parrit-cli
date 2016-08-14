require 'net/http'

module Parrit
  class RequestFactory    
    def request(verb:, route:, body:)
      url = URI.parse("http://parrit.cfapps.io/#{route}")
      Parrit::Request.new(verb, url, body)
    end
  end
end