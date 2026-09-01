private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @integration_name
        raise Core::ValidationError.new("integrationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("integrationName length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("integrationName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@integration_name, @force)
  end
end
