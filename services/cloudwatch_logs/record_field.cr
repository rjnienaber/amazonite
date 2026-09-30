private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # A structure that represents a valid record field header and whether it is mandatory.
  class RecordField
    include JSON::Serializable

    # The name to use when specifying this record field in a
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html)
    # or
    # [UpdateDeliveryConfiguration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html)
    # operation.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # If this is `true`, the record field must be present in the `recordFields` parameter provided to
    # a
    # [CreateDelivery](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html)
    # or
    # [UpdateDeliveryConfiguration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateDeliveryConfiguration.html)
    # operation.
    @[JSON::Field(key: "mandatory")]
    property mandatory : Bool | Nil

    def initialize(
      @name : String | Nil = nil,
      @mandatory : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("name length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@name, @mandatory)
  end
end
