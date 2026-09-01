private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Metadata assigned to the stream or consumer, consisting of a key-value pair.
  class Tag
    include JSON::Serializable

    # A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode
    # letters, digits, white space, _ . / = + - % @
    @[JSON::Field(key: "Key")]
    property key : String

    # An optional string, typically used to describe or define the tag. Maximum length: 256
    # characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % @
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @key : String,
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
