module Amazonite::DynamoDBV2
  class DescribeEndpointsResponse
    include JSON::Serializable

    @[JSON::Field(key: "Endpoints")]
    property endpoints : Array(Endpoint)

    def initialize(
      @endpoints : Array(Endpoint)
    )
    end
  end
end
