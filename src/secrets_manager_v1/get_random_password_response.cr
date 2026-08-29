module Amazonite::SecretsManagerV1
  class GetRandomPasswordResponse
    include JSON::Serializable

    # A string with the password.
    @[JSON::Field(key: "RandomPassword")]
    property random_password : String | Nil

    def initialize(
      @random_password : String | Nil = nil,
    )
    end
  end
end
