private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeDeliverySourcesRequest
    include JSON::Serializable

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Optionally specify the maximum number of delivery sources to return in the response.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # An array of Amazon Resource Names (ARNs) that filters the results to delivery sources associated
    # with any specified ARN.
    @[JSON::Field(key: "resourceArns")]
    property resource_arns : Array(String) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @resource_arns : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end

      if value = @resource_arns
        raise Core::ValidationError.new("resourceArns must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("resourceArns must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@next_token, @limit, @resource_arns)
  end
end
