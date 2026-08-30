module Amazonite::CloudWatchLogsV1
  class UntagResourceRequest
    include JSON::Serializable

    # The ARN of the CloudWatch Logs resource that you're removing tags from.
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

    # The list of tag keys to remove from the resource.
    @[JSON::Field(key: "tagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String),
    )
    end

    def_equals_and_hash(@resource_arn, @tag_keys)
  end
end
