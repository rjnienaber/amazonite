module Amazonite::CloudWatchLogsV1
  # This structure contains information about the integration configuration. For an integration with
  # OpenSearch Service, this includes information about OpenSearch Service resources such as the
  # collection, the workspace, and policies.
  #
  # This structure is returned by a
  # [GetIntegration](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetIntegration.html)
  # operation.
  class IntegrationDetails
    include JSON::Serializable

    # This structure contains complete information about one integration between CloudWatch Logs and
    # OpenSearch Service.
    @[JSON::Field(key: "openSearchIntegrationDetails")]
    property open_search_integration_details : OpenSearchIntegrationDetails | Nil

    def initialize(
      @open_search_integration_details : OpenSearchIntegrationDetails | Nil = nil,
    )
    end

    def_equals_and_hash(@open_search_integration_details)
  end
end
