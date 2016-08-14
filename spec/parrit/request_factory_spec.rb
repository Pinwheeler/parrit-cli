require 'spec_helper'
require 'errors'

describe Parrit::RequestFactory do
  let(:subject) { Parrit::RequestFactory.new }
  
  describe '#request' do
    it 'creates a request object' do
      request = subject.request(verb: :GET, route: 'path', body: { "header": "value", "header2": "value2" })
      expect(request.verb).to eq(:GET)
      expect(request.route.to_s).to eq('http://parrit.cfapps.io/path')
      expect(request.body).to eq({ "header": "value", "header2": "value2" })
    end
  end
end