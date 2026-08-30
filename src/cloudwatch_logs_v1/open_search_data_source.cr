module Amazonite::CloudWatchLogsV1
  # This structure contains information about the OpenSearch Service data source used for this
  # integration. This data source was created as part of the integration setup. An OpenSearch
  # Service data source defines the source and destination for OpenSearch Service queries. It
  # includes the role required to execute queries and write to collections.
  #
  # For more information about OpenSearch Service data sources , see [Creating OpenSearch Service
  # data source integrations with Amazon
  # S3.](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/direct-query-s3-creating.html)
  class OpenSearchDataSource
    include JSON::Serializable

    # The name of the OpenSearch Service data source.
    @[JSON::Field(key: "dataSourceName")]
    property data_source_name : String | Nil

    # This structure contains information about the status of this OpenSearch Service resource.
    @[JSON::Field(key: "status")]
    property status : OpenSearchResourceStatus | Nil

    def initialize(
      @data_source_name : String | Nil = nil,
      @status : OpenSearchResourceStatus | Nil = nil,
    )
    end

    def_equals_and_hash(@data_source_name, @status)
  end
end
