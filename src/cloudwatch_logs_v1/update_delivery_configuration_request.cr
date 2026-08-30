private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("id does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z]+$"))
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
    end

    def_equals_and_hash(@id, @record_fields, @field_delimiter, @s3_delivery_configuration)
  end
end
