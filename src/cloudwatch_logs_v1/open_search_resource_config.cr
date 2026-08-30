module Amazonite::CloudWatchLogsV1
  # This structure contains configuration details about an integration between CloudWatch Logs and
  # OpenSearch Service.
  class OpenSearchResourceConfig
    include JSON::Serializable

    # To have the vended dashboard data encrypted with KMS instead of the CloudWatch Logs default
    # encryption method, specify the ARN of the KMS key that you want to use.
    @[JSON::Field(key: "kmsKeyArn")]
    property kms_key_arn : String | Nil

    # Specify the ARN of an IAM role that CloudWatch Logs will use to create the integration. This
    # role must have the permissions necessary to access the OpenSearch Service collection to be able
    # to create the dashboards. For more information about the permissions needed, see [Permissions
    # that the integration
    # needs](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/OpenSearch-Dashboards-CreateRole.html)
    # in the CloudWatch Logs User Guide.
    @[JSON::Field(key: "dataSourceRoleArn")]
    property data_source_role_arn : String

    # Specify the ARNs of IAM roles and IAM users who you want to grant permission to for viewing the
    # dashboards.
    #
    # In addition to specifying these users here, you must also grant them the
    # **CloudWatchOpenSearchDashboardAccess** IAM policy. For more information, see [IAM policies for
    # users](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/OpenSearch-Dashboards-UserRoles.html).
    @[JSON::Field(key: "dashboardViewerPrincipals")]
    property dashboard_viewer_principals : Array(String) = [] of String

    # If you want to use an existing OpenSearch Service application for your integration with
    # OpenSearch Service, specify it here. If you omit this, a new application will be created.
    @[JSON::Field(key: "applicationArn")]
    property application_arn : String | Nil

    # Specify how many days that you want the data derived by OpenSearch Service to be retained in the
    # index that the dashboard refers to. This also sets the maximum time period that you can choose
    # when viewing data in the dashboard. Choosing a longer time frame will incur additional costs.
    @[JSON::Field(key: "retentionDays")]
    property retention_days : Int32

    def initialize(
      @data_source_role_arn : String,
      @dashboard_viewer_principals : Array(String),
      @retention_days : Int32,
      @kms_key_arn : String | Nil = nil,
      @application_arn : String | Nil = nil,
    )
    end
  end
end
