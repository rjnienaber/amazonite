private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("resourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("resourceArn length must be <= 1011") if value.size > 1011
        raise Core::ValidationError.new("resourceArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=/:,.@-]*$"))
      end
    end

    def_equals_and_hash(@resource_arn)
  end
end
