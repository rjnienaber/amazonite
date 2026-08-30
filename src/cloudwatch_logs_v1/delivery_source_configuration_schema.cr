private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
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
  end
end
