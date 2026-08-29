module Amazonite::EventBridgeV1
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
  end
end
