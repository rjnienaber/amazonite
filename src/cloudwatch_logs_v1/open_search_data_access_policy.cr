module Amazonite::CloudWatchLogsV1
  # This structure contains information about the OpenSearch Service data access policy used for
  # this integration. The access policy defines the access controls for the collection. This data
  # access policy was automatically created as part of the integration setup. For more information
  # about OpenSearch Service data access policies, see [Data access control for Amazon OpenSearch
  # Serverless](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html)
  # in the OpenSearch Service Developer Guide.
  class OpenSearchDataAccessPolicy
    include JSON::Serializable

    # The name of the data access policy.
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
