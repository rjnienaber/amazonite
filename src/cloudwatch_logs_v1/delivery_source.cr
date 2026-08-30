private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # This structure contains information about one *delivery source* in your account. A delivery
  # source is an Amazon Web Services resource that sends logs to an Amazon Web Services destination.
  # The destination can be CloudWatch Logs, Amazon S3, or Firehose.
  #
  # Only some Amazon Web Services services support being configured as a delivery source. These
  # services are listed as **Supported [V2 Permissions]** in the table at [Enabling logging from
  # Amazon Web Services
  # services.](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html)
  #
  # To configure logs delivery between a supported Amazon Web Services service and a destination,
  # you must do the following:
  #
  # - Create a delivery source, which is a logical object that represents the resource that is
  # actually sending the logs. For more information, see
  # [PutDeliverySource](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html).
  #
  # - Create a *delivery destination*, which is a logical object that represents the actual delivery
  # destination. For more information, see
  # [PutDeliveryDestination](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html).
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
  class DeliverySource
    include JSON::Serializable

    # The unique name of the delivery source.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The Amazon Resource Name (ARN) that uniquely identifies this delivery source.
    @[JSON::Field(key: "arn")]
    property arn : String | Nil

    # This array contains the ARN of the Amazon Web Services resource that sends logs and is
    # represented by this delivery source. Currently, only one ARN can be in the array.
    @[JSON::Field(key: "resourceArns")]
    property resource_arns : Array(String) | Nil

    # The Amazon Web Services service that is sending logs.
    @[JSON::Field(key: "service")]
    property service : String | Nil

    # The type of log that the source is sending. For valid values for this parameter, see the
    # documentation for the source service.
    @[JSON::Field(key: "logType")]
    property log_type : String | Nil

    # The tags that have been assigned to this delivery source.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    # The map of key-value pairs that configure the delivery source.
    @[JSON::Field(key: "deliverySourceConfiguration")]
    property delivery_source_configuration : Hash(String, String) | Nil

    # The status of the delivery source. A delivery source can have the status `ACTIVE` or `INACTIVE`.
    # Note: This value is defined for selective log types.
    @[JSON::Field(key: "status", converter: ACWL::DeliverySourceStatus)]
    property status : DeliverySourceStatus | Nil

    # The reason for the status of the delivery source. A status reason of `RESOURCE_DELETED`
    # indicates that the resource associated with the delivery source has been deleted. Note: This
    # value is defined for selective log types.
    @[JSON::Field(key: "statusReason", converter: ACWL::DeliverySourceStatusReason)]
    property status_reason : DeliverySourceStatusReason | Nil

    def initialize(
      @name : String | Nil = nil,
      @arn : String | Nil = nil,
      @resource_arns : Array(String) | Nil = nil,
      @service : String | Nil = nil,
      @log_type : String | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @delivery_source_configuration : Hash(String, String) | Nil = nil,
      @status : DeliverySourceStatus | Nil = nil,
      @status_reason : DeliverySourceStatusReason | Nil = nil,
    )
    end

    def_equals_and_hash(@name, @arn, @resource_arns, @service, @log_type, @tags, @delivery_source_configuration, @status, @status_reason)
  end
end
