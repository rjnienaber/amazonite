private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @integration_name
        raise Core::ValidationError.new("integrationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("integrationName length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("integrationName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@integration_name)
  end
end
