private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for CloudWatch Logs as a logging destination.
  class VerifiedAccessLogCloudWatchLogsDestinationOptions
    # Indicates whether logging is enabled.
    property enabled : Bool

    # The ID of the CloudWatch Logs log group.
    property log_group : String | Nil

    def initialize(
      @enabled : Bool,
      @log_group : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Enabled", Core::QueryValue.bool(@enabled)}

      if value = @log_group
        params << {"#{prefix}LogGroup", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")).not_nil!,
        log_group: Core::XMLValue.string(node.xpath_node("*[local-name()='LogGroup']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @log_group)
  end
end
