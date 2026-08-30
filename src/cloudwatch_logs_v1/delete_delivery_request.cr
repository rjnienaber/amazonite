module Amazonite::CloudWatchLogsV1
  class DeleteDeliveryRequest
    include JSON::Serializable

    # The unique ID of the delivery to delete. You can find the ID of a delivery with the
    # [DescribeDeliveries](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html)
    # operation.
    @[JSON::Field(key: "id")]
    property id : String

    def initialize(
      @id : String,
    )
    end

    def_equals_and_hash(@id)
  end
end
