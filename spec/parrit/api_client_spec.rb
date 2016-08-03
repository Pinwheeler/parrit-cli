require 'spec_helper'

describe Parrit::ApiClient do
  describe '#login' do
    let(:network_service) { double('network_service') }
    let(:subject) { Parrit::ApiClient.new(network_service: network_service) }

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
        rack_success_response = [ 200, {}, [] ]
        allow(network_service).to receive(:login) { rack_success_response }
        username = 'haha'
        password = 'password'

        subject.login(username: username, password: password)

        expect(subject.status).to eq(200)
      end

      it 'includes auth token in subsequent requests'
    end

    context 'with invalid arguments' do
      it 'raises invalid ArgumentError' do
        expect { subject.login }.to raise_error(ArgumentError)
      end
    end

    context 'with bad credentials' do
      it 'sets status to 401' do
        rack_failed_response = [ 401, {}, [] ]
        allow(network_service).to receive(:login) { rack_failed_response }
        username = 'user'
        password = 'bad_password'

        subject.login(username: username, password: password)

        expect(subject.status).to eq(401)
      end
    end
  end
end
