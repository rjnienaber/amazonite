private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Reserved for internal use.
  class RegistrationMetadataItem
    include JSON::Serializable

    # Reserved for internal use.
    @[JSON::Field(key: "Key")]
    property key : String

    # Reserved for internal use.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @key : String,
      @value : String,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Key does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Value length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("Value does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
