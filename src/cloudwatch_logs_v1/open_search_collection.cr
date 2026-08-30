module Amazonite::CloudWatchLogsV1
  # This structure contains information about the OpenSearch Service collection used for this
  # integration. An OpenSearch Service collection is a logical grouping of one or more indexes that
  # represent an analytics workload. For more information, see [Creating and managing OpenSearch
  # Service Serverless
  # collections](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-collections.html).
  class OpenSearchCollection
    include JSON::Serializable

    # The endpoint of the collection.
    @[JSON::Field(key: "collectionEndpoint")]
    property collection_endpoint : String | Nil

    # The ARN of the collection.
    @[JSON::Field(key: "collectionArn")]
    property collection_arn : String | Nil

    # This structure contains information about the status of this OpenSearch Service resource.
    @[JSON::Field(key: "status")]
    property status : OpenSearchResourceStatus | Nil

    def initialize(
      @collection_endpoint : String | Nil = nil,
      @collection_arn : String | Nil = nil,
      @status : OpenSearchResourceStatus | Nil = nil,
    )
    end
  end
end
