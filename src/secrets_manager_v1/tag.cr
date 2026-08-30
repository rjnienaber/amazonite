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

    def_equals_and_hash(@key, @value)
  end
end
