private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  # A structure that contains information about a tag.
  class Tag
    include JSON::Serializable

    # The key identifier, or name, of the tag.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The string value associated with the key of the tag.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @value : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
