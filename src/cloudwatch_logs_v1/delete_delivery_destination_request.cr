module Amazonite::CloudWatchLogsV1
  class DeleteDeliveryDestinationRequest
    include JSON::Serializable

    # The name of the delivery destination that you want to delete. You can find a list of delivery
    # destination names by using the
    # [DescribeDeliveryDestinations](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveryDestinations.html)
    # operation.
    @[JSON::Field(key: "name")]
    property name : String

    def initialize(
      @name : String,
    )
    end
  end
end
