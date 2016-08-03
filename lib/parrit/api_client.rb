require "pry"

module Parrit
  class ApiClient
    attr_reader :status
    attr_reader :network_service

    def initialize(network_service:)
      @status = 204
      @network_service = network_service
      @auth_token = 'unauthenticated'
    end

    def login(username:, password:)
      response = network_service.login(username, password)
      self.status = response[0]
      self.auth_token = response[1]
    end

    def get_state
      token = self.auth_token
      network_service.get_state(token)
    end

    protected
    attr_writer :status
    attr_accessor :auth_token
  end
end
