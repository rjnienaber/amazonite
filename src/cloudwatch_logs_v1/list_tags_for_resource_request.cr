module Amazonite::CloudWatchLogsV1
  class ListTagsForResourceRequest
    include JSON::Serializable

    # The ARN of the resource that you want to view tags for.
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

    def initialize(
      @resource_arn : String,
    )
    end

    def_equals_and_hash(@resource_arn)
  end
end
