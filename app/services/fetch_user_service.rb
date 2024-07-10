require 'httparty'

class FetchUserService
  include HTTParty
  base_uri 'https://dummyjson.com'

  def call
    response = fetch_user_data
    create_user(parse_response(response))
  rescue HTTParty::Error => e
    handle_error("HTTP error", e.message)
  rescue StandardError => e
    handle_error("General error", e.message)
  end

  private

  def fetch_user_data
    self.class.get("/users/1")
  end

  def create_user(user_data)
    user_data = user_data.slice("firstName", "lastName", "maidenName", "email", "phone")

    User.create(user_data.transform_keys { |key| key.to_s.underscore })
  end

  def parse_response(response)
    if response.success?
      JSON.parse(response.body)
    else
      handle_error("Error fetching user", response.message)
    end
  end

  def handle_error(error_type, message)
    raise "#{error_type}: #{message}"
  end
end
