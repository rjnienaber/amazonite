module Amazonite::CloudWatchLogsV1
  # This structure contains the default values that are used for each configuration parameter when
  # you use
  # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html)
  # to create a deliver under the current service type, resource type, and log type.
  class ConfigurationTemplateDeliveryConfigValues
    include JSON::Serializable

    # The default record fields that will be delivered when a list of record fields is not provided in
    # a
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html)
    # operation.
    @[JSON::Field(key: "recordFields")]
    property record_fields : Array(String) | Nil

    # The default field delimiter that is used in a
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html)
    # operation when the field delimiter is not specified in that operation. The field delimiter is
    # used only when the final output delivery is in `Plain`, `W3C`, or `Raw` format.
    @[JSON::Field(key: "fieldDelimiter")]
    property field_delimiter : String | Nil

    # The delivery parameters that are used when you create a delivery to a delivery destination that
    # is an S3 Bucket.
    @[JSON::Field(key: "s3DeliveryConfiguration")]
    property s3_delivery_configuration : S3DeliveryConfiguration | Nil

    def initialize(
      @record_fields : Array(String) | Nil = nil,
      @field_delimiter : String | Nil = nil,
      @s3_delivery_configuration : S3DeliveryConfiguration | Nil = nil,
    )
    end
  end
end
