private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # A key-value pair associated with an Amazon Web Services resource. In EventBridge, rules and
  # event buses support tagging.
  class Tag
    include JSON::Serializable

    # A string you can use to assign a value. The combination of tag keys and values can help you
    # organize and categorize your resources.
    @[JSON::Field(key: "Key")]
    property key : String

    # The value for the specified tag key.
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
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Value length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@key, @value)
  end
end
