private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class PutDeliveryDestinationRequest
    include JSON::Serializable

    # A name for this delivery destination. This name must be unique for all delivery destinations in
    # your account.
    @[JSON::Field(key: "name")]
    property name : String

    # The format for the logs that this delivery destination will receive.
    @[JSON::Field(key: "outputFormat", converter: ACWL::OutputFormat)]
    property output_format : OutputFormat | Nil

    # A structure that contains the ARN of the Amazon Web Services resource that will receive the
    # logs.
    #
    # `deliveryDestinationConfiguration` is required for CloudWatch Logs, Amazon S3, Firehose log
    # delivery destinations and not required for X-Ray trace delivery destinations.
    # `deliveryDestinationType` is needed for X-Ray trace delivery destinations but not required for
    # other logs delivery destinations.
    @[JSON::Field(key: "deliveryDestinationConfiguration")]
    property delivery_destination_configuration : DeliveryDestinationConfiguration | Nil

    # The type of delivery destination. This parameter specifies the target service where log data
    # will be delivered. Valid values include:
    #
    # - `S3` - Amazon S3 for long-term storage and analytics
    #
    # - `CWL` - CloudWatch Logs for centralized log management
    #
    # - `FH` - Amazon Kinesis Data Firehose for real-time data streaming
    #
    # - `XRAY` - Amazon Web Services X-Ray for distributed tracing and application monitoring
    #
    # The delivery destination type determines the format and configuration options available for log
    # delivery.
    @[JSON::Field(key: "deliveryDestinationType", converter: ACWL::DeliveryDestinationType)]
    property delivery_destination_type : DeliveryDestinationType | Nil

    # An optional list of key-value pairs to associate with the resource.
    #
    # For more information about tagging, see [Tagging Amazon Web Services
    # resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @name : String,
      @output_format : OutputFormat | Nil = nil,
      @delivery_destination_configuration : DeliveryDestinationConfiguration | Nil = nil,
      @delivery_destination_type : DeliveryDestinationType | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("name length must be <= 60") if value.size > 60
        raise Core::ValidationError.new("name does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]*$"))
      end

      if value = @delivery_destination_configuration
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@name, @output_format, @delivery_destination_configuration, @delivery_destination_type, @tags)
  end
end
