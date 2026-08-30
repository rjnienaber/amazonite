module Amazonite::CloudWatchV1
  # A key-value pair associated with a CloudWatch resource.
  class Tag
    include JSON::Serializable

    # A string that you can use to assign a value. The combination of tag keys and values can help you
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

    def_equals_and_hash(@key, @value)
  end
end
