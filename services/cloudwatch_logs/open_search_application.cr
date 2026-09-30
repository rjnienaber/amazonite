private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # This structure contains information about the OpenSearch Service application used for this
  # integration. An OpenSearch Service application is the web application created by the integration
  # with CloudWatch Logs. It hosts the vended logs dashboards.
  class OpenSearchApplication
    include JSON::Serializable

    # The endpoint of the application.
    @[JSON::Field(key: "applicationEndpoint")]
    property application_endpoint : String | Nil

    # The Amazon Resource Name (ARN) of the application.
    @[JSON::Field(key: "applicationArn")]
    property application_arn : String | Nil

    # The ID of the application.
    @[JSON::Field(key: "applicationId")]
    property application_id : String | Nil

    # This structure contains information about the status of this OpenSearch Service resource.
    @[JSON::Field(key: "status")]
    property status : OpenSearchResourceStatus | Nil

    def initialize(
      @application_endpoint : String | Nil = nil,
      @application_arn : String | Nil = nil,
      @application_id : String | Nil = nil,
      @status : OpenSearchResourceStatus | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @application_endpoint
        raise Core::ValidationError.new("applicationEndpoint length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("applicationEndpoint length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("applicationEndpoint does not match the required pattern") unless value.matches?(Regex.new("^https://[\\.\\-_/#:A-Za-z0-9]+\\.com$"))
      end

      if value = @application_id
        raise Core::ValidationError.new("applicationId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("applicationId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("applicationId does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@application_endpoint, @application_arn, @application_id, @status)
  end
end
