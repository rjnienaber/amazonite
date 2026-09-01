private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Contains logging configuration information for an extension.
  class LoggingConfig
    # The Amazon Resource Name (ARN) of the role that CloudFormation should assume when sending log
    # entries to CloudWatch Logs.
    property log_role_arn : String

    # The Amazon CloudWatch Logs group to which CloudFormation sends error logging information when
    # invoking the extension's handlers.
    property log_group_name : String

    def initialize(
      @log_role_arn : String,
      @log_group_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}LogRoleArn", @log_role_arn}

      params << {"#{prefix}LogGroupName", @log_group_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        log_role_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='LogRoleArn']")).not_nil!,
        log_group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='LogGroupName']")).not_nil!,
      )
    end

    def validate! : Nil
      if value = @log_role_arn
        raise Core::ValidationError.new("LogRoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LogRoleArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("LogRoleArn does not match the required pattern") unless value.matches?(Regex.new("^arn:.+:iam::[0-9]{12}:role/.+$"))
      end

      if value = @log_group_name
        raise Core::ValidationError.new("LogGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("LogGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("LogGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@log_role_arn, @log_group_name)
  end
end
