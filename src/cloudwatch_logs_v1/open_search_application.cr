module Amazonite::CloudWatchLogsV1
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
  end
end
