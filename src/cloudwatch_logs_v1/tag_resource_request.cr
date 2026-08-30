module Amazonite::CloudWatchLogsV1
  class TagResourceRequest
    include JSON::Serializable

    # The ARN of the resource that you're adding tags to.
    #
    # The ARN format of a log group is `arn:aws:logs:*Region*:*account-id*:log-group:*log-group-name*
    # `
    #
    # The ARN format of a destination is
    # `arn:aws:logs:*Region*:*account-id*:destination:*destination-name* `
    #
    # For more information about ARN format, see [CloudWatch Logs resources and
    # operations](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html).
    @[JSON::Field(key: "resourceArn")]
    property resource_arn : String

    # The list of key-value pairs to associate with the resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String)

    def initialize(
      @resource_arn : String,
      @tags : Hash(String, String),
    )
    end
  end
end
