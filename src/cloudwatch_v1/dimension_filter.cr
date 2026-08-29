module Amazonite::CloudWatchV1
  # Represents filters for a dimension.
  class DimensionFilter
    include JSON::Serializable

    # The dimension name to be matched.
    @[JSON::Field(key: "Name")]
    property name : String

    # The value of the dimension to be matched.
    @[JSON::Field(key: "Value")]
    property value : String | Nil

    def initialize(
      @name : String,
      @value : String | Nil = nil,
    )
    end
  end
end
