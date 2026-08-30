private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # A dimension is a name/value pair that is part of the identity of a metric. Because dimensions
  # are part of the unique identifier for a metric, whenever you add a unique name/value pair to one
  # of your metrics, you are creating a new variation of that metric. For example, many Amazon EC2
  # metrics publish `InstanceId` as a dimension name, and the actual instance ID as the value for
  # that dimension.
  #
  # You can assign up to 30 dimensions to a metric.
  class Dimension
    include JSON::Serializable

    # The name of the dimension. Dimension names must contain only ASCII characters, must include at
    # least one non-whitespace character, and cannot start with a colon (`:`). ASCII control
    # characters are not supported as part of dimension names.
    @[JSON::Field(key: "Name")]
    property name : String

    # The value of the dimension. Dimension values must contain only ASCII characters and must include
    # at least one non-whitespace character. ASCII control characters are not supported as part of
    # dimension values.
    @[JSON::Field(key: "Value")]
    property value : String

    def initialize(
      @name : String,
      @value : String,
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
