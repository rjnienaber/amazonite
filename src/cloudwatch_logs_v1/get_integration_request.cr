module Amazonite::CloudWatchLogsV1
  class GetIntegrationRequest
    include JSON::Serializable

    # The name of the integration that you want to find information about. To find the name of your
    # integration, use
    # [ListIntegrations](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html)
    @[JSON::Field(key: "integrationName")]
    property integration_name : String

    def initialize(
      @integration_name : String,
    )
    end
  end
end
