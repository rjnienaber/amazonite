module Amazonite::CloudWatchV1
  class Dimension
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @name : String,
      @value : String,
    )
    end
  end
end
