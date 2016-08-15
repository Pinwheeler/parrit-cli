require 'spec_helper'

describe Parrit::Request do
  let(:subject) { Parrit::Request.new(:GET, 'path', {"header": "value", "header2": "value2" }) }
  
  describe 'initialization' do
    it 'should have an internal HTTP request' do
      internal_request = subject.http_request
      expect(internal_request.class).to eq(Net::HTTP::Get)
      expect(internal_request.uri.to_s).to eq('http://parrit.cfapps.io/path')
    end
  end
end