private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Specifies the resource ARN for a `DeleteResourceMetricsConfiguration` request.
  class DeleteResourceMetricsConfigurationInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Amazon Web Services resource to delete the resource
    # metrics configuration for.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    def initialize(
      @resource_arn : String,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ResourceArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ResourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[a-zA-Z0-9-]+:[a-zA-Z0-9-]+:[a-zA-Z0-9-]*:\\d{12}:.+$"))
      end
    end

    def_equals_and_hash(@resource_arn)
  end
end
