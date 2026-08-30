module Amazonite::DynamoDBV2
  class DescribeEndpointsResponse
    include JSON::Serializable

    # List of endpoints.
    @[JSON::Field(key: "Endpoints")]
    property endpoints : Array(Endpoint) = [] of Endpoint

    def initialize(
      @endpoints : Array(Endpoint),
    )
    end

    def_equals_and_hash(@endpoints)
  end
end
