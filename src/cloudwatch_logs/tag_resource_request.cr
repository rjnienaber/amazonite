private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("resourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("resourceArn length must be <= 1011") if value.size > 1011
        raise Core::ValidationError.new("resourceArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]*$"))
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@resource_arn, @tags)
  end
end
