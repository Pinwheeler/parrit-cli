require "pry"

module Parrit
  class ApiClient
    attr_reader :status
    attr_reader :network_service

    def initialize(network_service:)
      @status = 204
      @network_service = network_service
    end

    def login(username:, password:)
      response = network_service.login(username, password)
      self.status = response[0]
    end

    def get_state
      network_service.get_state
    end

    private

    def status=(code)
      @status = code
    end
  end
end
