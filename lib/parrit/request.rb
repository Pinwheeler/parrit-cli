module Parrit
  class Request    
    def initialize(verb, route, body)
      @verb = verb
      @route = route
      @body = body
    end
    
    def verb
      @verb
    end
    
    def route
      @route
    end
    
    def body
      @body
    end
  end
end
