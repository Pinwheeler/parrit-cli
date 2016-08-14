module Parrit
  class NetworkService
    def initialize(request_factory:)
      @request_factory = request_factory
    end
    
    def login(project:, password:)
      @request_factory.request(:POST, 'login', {"name": project, "password": password })
    end
  end
end
