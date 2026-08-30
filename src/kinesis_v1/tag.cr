module Amazonite::KinesisV1
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
  end
end
