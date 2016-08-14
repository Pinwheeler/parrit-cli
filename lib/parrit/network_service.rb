module Parrit
  class NetworkService
    def initialize(request_factory:)
      @request_factory = request_factory
    end
    
    def login(project:, password:)
      request = @request_factory.request(:POST, 'login', {"name": project, "password": password })
      request.start
    end
  end
end
