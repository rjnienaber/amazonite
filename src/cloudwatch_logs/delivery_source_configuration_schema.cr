private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # A structure that describes a single configuration for a log type, including its name, value
  # type, default value, and the range of supported values.
  class DeliverySourceConfigurationSchema
    include JSON::Serializable

    # The name of the configuration.
    @[JSON::Field(key: "keyName")]
    property key_name : String

    # The data type of the configuration value. Valid values are `string`, `boolean`, `int`, `double`,
    # and `long`.
    @[JSON::Field(key: "valueType", converter: ACWL::DeliverySourceConfigurationSchemaValueType)]
    property value_type : DeliverySourceConfigurationSchemaValueType

    # The default value of the configuration that is used when a value is not specified in a
    # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html)
    # request.
    @[JSON::Field(key: "defaultValue")]
    property default_value : String

    # The list of allowed values for the configuration. Empty for free-form configuration.
    @[JSON::Field(key: "supportedValues")]
    property supported_values : Array(String) | Nil

    # The minimum numeric value allowed for the configuration. This applies only when the `valueType`
    # is a numeric type.
    @[JSON::Field(key: "minValue")]
    property min_value : Float64 | Nil

    # The maximum numeric value allowed for the configuration. This applies only when the `valueType`
    # is a numeric type.
    @[JSON::Field(key: "maxValue")]
    property max_value : Float64 | Nil

    def initialize(
      @key_name : String,
      @value_type : DeliverySourceConfigurationSchemaValueType,
      @default_value : String,
      @supported_values : Array(String) | Nil = nil,
      @min_value : Float64 | Nil = nil,
      @max_value : Float64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key_name
        raise Core::ValidationError.new("keyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("keyName length must be <= 256") if value.size > 256
      end

      if value = @default_value
        raise Core::ValidationError.new("defaultValue length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("defaultValue length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@key_name, @value_type, @default_value, @supported_values, @min_value, @max_value)
  end
end
