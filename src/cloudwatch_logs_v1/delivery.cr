private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This structure contains information about one *delivery* in your account.
  #
  # A delivery is a connection between a logical *delivery source* and a logical *delivery
  # destination*.
  #
  # For more information, see
  # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html).
  #
  # To update an existing delivery configuration, use
  # [UpdateDeliveryConfiguration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html).
  class Delivery
    include JSON::Serializable

    # The unique ID that identifies this delivery in your account.
    @[JSON::Field(key: "id")]
    property id : String | Nil

    # The Amazon Resource Name (ARN) that uniquely identifies this delivery.
    @[JSON::Field(key: "arn")]
    property arn : String | Nil

    # The name of the delivery source that is associated with this delivery.
    @[JSON::Field(key: "deliverySourceName")]
    property delivery_source_name : String | Nil

    # The ARN of the delivery destination that is associated with this delivery.
    @[JSON::Field(key: "deliveryDestinationArn")]
    property delivery_destination_arn : String | Nil

    # Displays whether the delivery destination associated with this delivery is CloudWatch Logs,
    # Amazon S3, Firehose, or X-Ray.
    @[JSON::Field(key: "deliveryDestinationType", converter: ACWL::DeliveryDestinationType)]
    property delivery_destination_type : DeliveryDestinationType | Nil

    # The record fields used in this delivery.
    @[JSON::Field(key: "recordFields")]
    property record_fields : Array(String) | Nil

    # The field delimiter that is used between record fields when the final output format of a
    # delivery is in `Plain`, `W3C`, or `Raw` format.
    @[JSON::Field(key: "fieldDelimiter")]
    property field_delimiter : String | Nil

    # This structure contains delivery configurations that apply only when the delivery destination
    # resource is an S3 bucket.
    @[JSON::Field(key: "s3DeliveryConfiguration")]
    property s3_delivery_configuration : S3DeliveryConfiguration | Nil

    # The tags that have been assigned to this delivery.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @id : String | Nil = nil,
      @arn : String | Nil = nil,
      @delivery_source_name : String | Nil = nil,
      @delivery_destination_arn : String | Nil = nil,
      @delivery_destination_type : DeliveryDestinationType | Nil = nil,
      @record_fields : Array(String) | Nil = nil,
      @field_delimiter : String | Nil = nil,
      @s3_delivery_configuration : S3DeliveryConfiguration | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("id does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z]+$"))
      end

      if value = @delivery_source_name
        raise Core::ValidationError.new("deliverySourceName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("deliverySourceName length must be <= 60") if value.size > 60
        raise Core::ValidationError.new("deliverySourceName does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]*$"))
      end

      if value = @record_fields
        raise Core::ValidationError.new("recordFields must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("recordFields must have at most 128 item(s)") if value.size > 128
      end

      if value = @field_delimiter
        raise Core::ValidationError.new("fieldDelimiter length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("fieldDelimiter length must be <= 5") if value.size > 5
      end

      if value = @s3_delivery_configuration
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@id, @arn, @delivery_source_name, @delivery_destination_arn, @delivery_destination_type, @record_fields, @field_delimiter, @s3_delivery_configuration, @tags)
  end
end
