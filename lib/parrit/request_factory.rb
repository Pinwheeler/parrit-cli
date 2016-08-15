require 'net/http'

module Parrit
  class RequestFactory    
    def request(verb:, route:, body:)
      Parrit::Request.new(verb, route, body)
    end
  end
end