module Amazonite::CloudWatchLogsV1
  class CreateDeliveryRequest
    include JSON::Serializable

    # The name of the delivery source to use for this delivery.
    @[JSON::Field(key: "deliverySourceName")]
    property delivery_source_name : String

    # The ARN of the delivery destination to use for this delivery.
    @[JSON::Field(key: "deliveryDestinationArn")]
    property delivery_destination_arn : String

    # The list of record fields to be delivered to the destination, in order. If the delivery's log
    # source has mandatory fields, they must be included in this list.
    @[JSON::Field(key: "recordFields")]
    property record_fields : Array(String) | Nil

    # The field delimiter to use between record fields when the final output format of a delivery is
    # in `Plain`, `W3C`, or `Raw` format.
    @[JSON::Field(key: "fieldDelimiter")]
    property field_delimiter : String | Nil

    # This structure contains parameters that are valid only when the delivery's delivery destination
    # is an S3 bucket.
    @[JSON::Field(key: "s3DeliveryConfiguration")]
    property s3_delivery_configuration : S3DeliveryConfiguration | Nil

    # An optional list of key-value pairs to associate with the resource.
    #
    # For more information about tagging, see [Tagging Amazon Web Services
    # resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @delivery_source_name : String,
      @delivery_destination_arn : String,
      @record_fields : Array(String) | Nil = nil,
      @field_delimiter : String | Nil = nil,
      @s3_delivery_configuration : S3DeliveryConfiguration | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
