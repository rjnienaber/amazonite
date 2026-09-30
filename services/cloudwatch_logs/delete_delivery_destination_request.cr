private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("name length must be <= 60") if value.size > 60
        raise Core::ValidationError.new("name does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]*$"))
      end
    end

    def_equals_and_hash(@name)
  end
end
