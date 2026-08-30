module Amazonite::CloudWatchLogsV1
  class UpdateDeliveryConfigurationRequest
    include JSON::Serializable

    # The ID of the delivery to be updated by this request.
    @[JSON::Field(key: "id")]
    property id : String

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

    def initialize(
      @id : String,
      @record_fields : Array(String) | Nil = nil,
      @field_delimiter : String | Nil = nil,
      @s3_delivery_configuration : S3DeliveryConfiguration | Nil = nil,
    )
    end
  end
end
