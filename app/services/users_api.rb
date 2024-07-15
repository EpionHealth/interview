class UsersApi
  class << self

    ##
    # Retrieve api for patient's information
    # @param [String] id
    # @return [Hash]
    def fetch(id:)
      response = Faraday.get("https://dummyjson.com/users/#{id}")
      return {} unless response.success?

      JSON.parse(response.body)
    rescue JSON::ParserError, Faraday::Error => e
      {}
    end
  end
end
