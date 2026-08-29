module Amazonite::CloudWatchV1
  class DimensionFilter
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @name : String,
      @value : String | Nil = nil,
    )
    end
  end
end
