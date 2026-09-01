module Amazonite::ApiGateway
  # Requests API Gateway to get information about the current Account resource.
  class GetAccountRequest
    include JSON::Serializable

    def initialize
    end

    def validate! : Nil
    end

    def_equals_and_hash()
  end
end
