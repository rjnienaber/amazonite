module Amazonite::CloudWatchLogsV1
  # This structure contains information about the OpenSearch Service encryption policy used for this
  # integration. The encryption policy was created automatically when you created the integration.
  # For more information, see [Encryption
  # policies](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-encryption.html#serverless-encryption-policies)
  # in the OpenSearch Service Developer Guide.
  class OpenSearchEncryptionPolicy
    include JSON::Serializable

    # The name of the encryption policy.
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
