private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class LoggingConfig
    property log_role_arn : String

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
  end
end
