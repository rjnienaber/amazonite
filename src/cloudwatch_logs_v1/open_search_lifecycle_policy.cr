module Amazonite::CloudWatchLogsV1
  # This structure contains information about the OpenSearch Service data lifecycle policy used for
  # this integration. The lifecycle policy determines the lifespan of the data in the collection. It
  # was automatically created as part of the integration setup.
  #
  # For more information, see [Using data lifecycle policies with OpenSearch Service
  # Serverless](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-lifecycle.html)
  # in the OpenSearch Service Developer Guide.
  class OpenSearchLifecyclePolicy
    include JSON::Serializable

    # The name of the lifecycle policy.
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
  end
end
