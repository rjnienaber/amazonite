module Amazonite::CloudWatchLogsV1
  class DeleteIntegrationRequest
    include JSON::Serializable

    # The name of the integration to delete. To find the name of your integration, use
    # [ListIntegrations](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListIntegrations.html).
    @[JSON::Field(key: "integrationName")]
    property integration_name : String

    # Specify `true` to force the deletion of the integration even if vended logs dashboards currently
    # exist.
    #
    # The default is `false`.
    @[JSON::Field(key: "force")]
    property force : Bool | Nil

    def initialize(
      @integration_name : String,
      @force : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@integration_name, @force)
  end
end
