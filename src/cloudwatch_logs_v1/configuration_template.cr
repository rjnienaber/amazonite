private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # A structure containing information about the deafult settings and available settings that you
  # can use to configure a
  # [delivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_Delivery.html)
  # or a [delivery
  # destination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeliveryDestination.html).
  class ConfigurationTemplate
    include JSON::Serializable

    # A string specifying which service this configuration template applies to. For more information
    # about supported services see [Enable logging from Amazon Web Services
    # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html).
    @[JSON::Field(key: "service")]
    property service : String | Nil

    # A string specifying which log type this configuration template applies to.
    @[JSON::Field(key: "logType")]
    property log_type : String | Nil

    # A string specifying which resource type this configuration template applies to.
    @[JSON::Field(key: "resourceType")]
    property resource_type : String | Nil

    # A string specifying which destination type this configuration template applies to.
    @[JSON::Field(key: "deliveryDestinationType", converter: ACWL::DeliveryDestinationType)]
    property delivery_destination_type : DeliveryDestinationType | Nil

    # A mapping that displays the default value of each property within a delivery's configuration, if
    # it is not specified in the request.
    @[JSON::Field(key: "defaultDeliveryConfigValues")]
    property default_delivery_config_values : ConfigurationTemplateDeliveryConfigValues | Nil

    # The allowed fields that a caller can use in the `recordFields` parameter of a
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html)
    # or
    # [UpdateDeliveryConfiguration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html)
    # operation.
    @[JSON::Field(key: "allowedFields")]
    property allowed_fields : Array(RecordField) | Nil

    # The list of delivery destination output formats that are supported by this log source.
    @[JSON::Field(key: "allowedOutputFormats", converter: Core::ArrayConverter(ACWL::OutputFormat))]
    property allowed_output_formats : Array(OutputFormat) | Nil

    # The action permissions that a caller needs to have to be able to successfully create a delivery
    # source on the desired resource type when calling
    # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).
    @[JSON::Field(key: "allowedActionForAllowVendedLogsDeliveryForResource")]
    property allowed_action_for_allow_vended_logs_delivery_for_resource : String | Nil

    # The valid values that a caller can use as field delimiters when calling
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html)
    # or
    # [UpdateDeliveryConfiguration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html)
    # on a delivery that delivers in `Plain`, `W3C`, or `Raw` format.
    @[JSON::Field(key: "allowedFieldDelimiters")]
    property allowed_field_delimiters : Array(String) | Nil

    # The list of variable fields that can be used in the suffix path of a delivery that delivers to
    # an S3 bucket.
    @[JSON::Field(key: "allowedSuffixPathFields")]
    property allowed_suffix_path_fields : Array(String) | Nil

    # The schema of the delivery source configuration that is available for this log type. Each
    # element describes a configuration that can be set when calling
    # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html),
    # including the configuration name, type, and default value.
    @[JSON::Field(key: "deliverySourceConfiguration")]
    property delivery_source_configuration : Array(DeliverySourceConfigurationSchema) | Nil

    # The S3 Tables integration configuration for this configuration template, including the
    # datasource name and type.
    @[JSON::Field(key: "s3TablesIntegration")]
    property s3_tables_integration : S3TablesIntegration | Nil

    def initialize(
      @service : String | Nil = nil,
      @log_type : String | Nil = nil,
      @resource_type : String | Nil = nil,
      @delivery_destination_type : DeliveryDestinationType | Nil = nil,
      @default_delivery_config_values : ConfigurationTemplateDeliveryConfigValues | Nil = nil,
      @allowed_fields : Array(RecordField) | Nil = nil,
      @allowed_output_formats : Array(OutputFormat) | Nil = nil,
      @allowed_action_for_allow_vended_logs_delivery_for_resource : String | Nil = nil,
      @allowed_field_delimiters : Array(String) | Nil = nil,
      @allowed_suffix_path_fields : Array(String) | Nil = nil,
      @delivery_source_configuration : Array(DeliverySourceConfigurationSchema) | Nil = nil,
      @s3_tables_integration : S3TablesIntegration | Nil = nil,
    )
    end
  end
end
