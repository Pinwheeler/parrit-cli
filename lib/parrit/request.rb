module Parrit
  class Request
        
    attr_reader :verb, :route, :body
    
    def initialize(verb, route, body)
      @verb = verb
      @route = route
      @body = body
    end
  end
end
