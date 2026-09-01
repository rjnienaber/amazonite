private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class UntagResourceInput
    include JSON::Serializable

    # The ARN of the CloudWatch resource that you're removing tags from.
    #
    # The ARN format of an alarm is `arn:aws:cloudwatch:*Region*:*account-id*:alarm:*alarm-name* `
    #
    # The ARN format of a Contributor Insights rule is
    # `arn:aws:cloudwatch:*Region*:*account-id*:insight-rule/*insight-rule-name* `
    #
    # The ARN format of a dashboard is `arn:aws:cloudwatch::*account-id*:dashboard/*dashboard-name* `
    #
    # The ARN format of a metric stream is
    # `arn:aws:cloudwatch:*Region*:*account-id*:metric-stream/*metric-stream-name* `
    #
    # For more information about ARN format, see [ Resource Types Defined by Amazon
    # CloudWatch](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazoncloudwatch.html#amazoncloudwatch-resources-for-iam-policies)
    # in the *Amazon Web Services General Reference*.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # The list of tag keys to remove from the resource.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String),
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceARN length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@resource_arn, @tag_keys)
  end
end
