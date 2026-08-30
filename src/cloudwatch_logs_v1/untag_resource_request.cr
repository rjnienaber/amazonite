private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("resourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("resourceArn length must be <= 1011") if value.size > 1011
        raise Core::ValidationError.new("resourceArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]*$"))
      end

      if value = @tag_keys
        raise Core::ValidationError.new("tagKeys must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("tagKeys must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@resource_arn, @tag_keys)
  end
end
