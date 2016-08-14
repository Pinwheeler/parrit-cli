require 'spec_helper'
require 'errors'

describe Parrit::NetworkService do
  let(:request_factory) { double('request_factory') }
  let(:subject) { Parrit::NetworkService.new(request_factory: request_factory) }
  let(:request) { double('request') }
  before(:each) do
    allow(request_factory).to receive(:request) { request }
  end
  
  describe '#login' do
    before(:each) do
      allow(request).to receive(:start)
    end
    
    it 'asks for the right request' do
      expect(request_factory).to receive(:request).with(:POST, 'login', { "name": "project", "password": "password" })
      
      subject.login(project: 'project', password: 'password')
    end
  end
end