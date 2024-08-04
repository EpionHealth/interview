require 'rails_helper'

RSpec.describe PatientInfoService, type: :service do
  describe '.call' do
    let(:patient_id) { 123 }
    let(:api_url) { "https://dummyjson.com/users/#{patient_id}" }
    let(:response_body) { { "firstName" => "Summer", "lastName" => "Doe" }.to_json }

    before do
      stub_request(:get, api_url).to_return(
        status: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    it 'makes a GET request to the correct URL' do
      PatientInfoService.call(patient_id)
      expect(WebMock).to have_requested(:get, api_url).once
    end

    it 'returns parsed JSON response' do
      result = PatientInfoService.call(patient_id)
      expected_result = JSON.parse(response_body)
      expect(result).to eq(expected_result)
    end
  end
end

