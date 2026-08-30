module Amazonite::CloudWatchLogsV1
  # This structure contains information about the OpenSearch Service network policy used for this
  # integration. The network policy assigns network access settings to collections. For more
  # information, see [Network
  # policies](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-network.html#serverless-network-policies)
  # in the OpenSearch Service Developer Guide.
  class OpenSearchNetworkPolicy
    include JSON::Serializable

    # The name of the network policy.
    @[JSON::Field(key: "policyName")]
    property policy_name : String | Nil

    # This structure contains information about the status of this OpenSearch Service resource.
    @[JSON::Field(key: "status")]
    property status : OpenSearchResourceStatus | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @status : OpenSearchResourceStatus | Nil = nil,
    )
    end

    def_equals_and_hash(@policy_name, @status)
  end
end
