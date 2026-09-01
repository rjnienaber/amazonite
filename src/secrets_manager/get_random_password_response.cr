private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class GetRandomPasswordResponse
    include JSON::Serializable

    # A string with the password.
    @[JSON::Field(key: "RandomPassword")]
    property random_password : String | Nil

    def initialize(
      @random_password : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @random_password
        raise Core::ValidationError.new("RandomPassword length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("RandomPassword length must be <= 4096") if value.size > 4096
      end
    end

    def_equals_and_hash(@random_password)
  end
end
