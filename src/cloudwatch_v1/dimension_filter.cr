private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 255") if value.size > 255
      end

      if value = @value
        raise Core::ValidationError.new("Value length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Value length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@name, @value)
  end
end
