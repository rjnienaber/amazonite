private alias Core = Amazonite::Core

module Amazonite::SsmV1
  # Configuration options for sending command output to Amazon CloudWatch Logs.
  class CloudWatchOutputConfig
    include JSON::Serializable

    # The name of the CloudWatch Logs log group where you want to send command output. If you don't
    # specify a group name, Amazon Web Services Systems Manager automatically creates a log group for
    # you. The log group uses the following naming format:
    #
    # `aws/ssm/*SystemsManagerDocumentName* `
    @[JSON::Field(key: "CloudWatchLogGroupName")]
    property cloud_watch_log_group_name : String | Nil

    # Enables Systems Manager to send command output to CloudWatch Logs.
    @[JSON::Field(key: "CloudWatchOutputEnabled")]
    property cloud_watch_output_enabled : Bool | Nil

    def initialize(
      @cloud_watch_log_group_name : String | Nil = nil,
      @cloud_watch_output_enabled : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @cloud_watch_log_group_name
        raise Core::ValidationError.new("CloudWatchLogGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CloudWatchLogGroupName length must be <= 512") if value.size > 512
      end
    end

    def_equals_and_hash(@cloud_watch_log_group_name, @cloud_watch_output_enabled)
  end
end
