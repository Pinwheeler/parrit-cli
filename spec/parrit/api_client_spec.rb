require 'spec_helper'

describe Parrit::ApiClient do
  let(:network_service) { double('network_service') }
  let(:subject) { Parrit::ApiClient.new(network_service: network_service) }
  let(:rack_success_response) { [ 200, {Authenticaion: 'token token_asdbsad'}, [] ] }
  let(:rack_failed_response) { [ 401, {}, [] ] }
  before(:each) do
    allow(network_service).to receive(:login) { rack_success_response }
  end

  describe '#login' do
    context 'with valid arguments' do
      it 'does not raise ArgumentError' do

        expect { subject.login(username: 'foobar', password: 'password') }
          .to_not raise_error
      end

      it 'passes username and password to network inteface' do
        username = 'user'
        password = 'password'
        expect(network_service).to receive(:login).with(username, password)

        subject.login(username: username, password: password)
      end

      it 'sets status to 200' do
        allow(network_service).to receive(:login) { rack_success_response }
        username = 'username'
        password = 'password'

        subject.login(username: username, password: password)

        expect(subject.status).to eq(200)
      end
    end

    context 'with invalid arguments' do
      it 'raises invalid ArgumentError' do
        expect { subject.login }.to raise_error(ArgumentError)
      end
    end

    context 'with bad credentials' do
      it 'sets status to 401' do
        allow(network_service).to receive(:login) { rack_failed_response }
        username = 'user'
        password = 'bad_password'

        subject.login(username: username, password: password)

        expect(subject.status).to eq(401)
      end
    end
  end
  describe '#get_state' do

    context 'once we have logged in' do
      before(:each) do
        subject.login(username:'mrmeeseeks', password:'lookatme')
      end

      it 'asks the network service for state' do
        expect(network_service.to receive(:get_state).with(Authentication: 'token token_asdbsad')
        subject.get_state
      end
    end

    context 'when we have not logged in' do
      it 'does not ask the network for state'

      it 'raises an no authentication error'
    end
  end
end
