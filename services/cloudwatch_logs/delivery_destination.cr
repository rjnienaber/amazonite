private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # This structure contains information about one *delivery destination* in your account. A delivery
  # destination is an Amazon Web Services resource that represents an Amazon Web Services service
  # that logs can be sent to. CloudWatch Logs, Amazon S3, Firehose, and X-Ray are supported as
  # delivery destinations.
  #
  # To configure logs delivery between a supported Amazon Web Services service and a destination,
  # you must do the following:
  #
  # - Create a delivery source, which is a logical object that represents the resource that is
  # actually sending the logs. For more information, see
  # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).
  #
  # - Create a *delivery destination*, which is a logical object that represents the actual delivery
  # destination.
  #
  # - If you are delivering logs cross-account, you must use
  # [PutDeliveryDestinationPolicy](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html)
  # in the destination account to assign an IAM policy to the destination. This policy allows
  # delivery to that destination.
  #
  # - Create a *delivery* by pairing exactly one delivery source and one delivery destination. For
  # more information, see
  # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html).
  #
  # You can configure a single delivery source to send logs to multiple destinations by creating
  # multiple deliveries. You can also create multiple deliveries to configure multiple delivery
  # sources to send logs to the same delivery destination.
  class DeliveryDestination
    include JSON::Serializable

    # The name of this delivery destination.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The Amazon Resource Name (ARN) that uniquely identifies this delivery destination.
    @[JSON::Field(key: "arn")]
    property arn : String | Nil

    # Displays whether this delivery destination is CloudWatch Logs, Amazon S3, Firehose, or X-Ray.
    @[JSON::Field(key: "deliveryDestinationType", converter: ACWL::DeliveryDestinationType)]
    property delivery_destination_type : DeliveryDestinationType | Nil

    # The format of the logs that are sent to this delivery destination.
    @[JSON::Field(key: "outputFormat", converter: ACWL::OutputFormat)]
    property output_format : OutputFormat | Nil

    # A structure that contains the ARN of the Amazon Web Services resource that will receive the
    # logs.
    @[JSON::Field(key: "deliveryDestinationConfiguration")]
    property delivery_destination_configuration : DeliveryDestinationConfiguration | Nil

    # The tags that have been assigned to this delivery destination.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @delivery_destination_type : DeliveryDestinationType | Nil = nil,
      @output_format : OutputFormat | Nil = nil,
      @delivery_destination_configuration : DeliveryDestinationConfiguration | Nil = nil,
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

    def_equals_and_hash(@name, @arn, @delivery_destination_type, @output_format, @delivery_destination_configuration, @tags)
  end
end
