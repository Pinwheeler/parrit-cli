require 'net/http'

module Parrit
  class Request
        
    attr_reader :verb, :route, :body, :http_request
    
    def initialize(verb, route, body)
      @verb = verb
      @route = URI.parse("http://parrit.cfapps.io/#{route}")
      @body = body
      
      @http_request = Net::HTTP::Get.new(@route)
    end
  end
end
