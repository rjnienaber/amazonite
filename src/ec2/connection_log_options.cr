private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the client connection logging options for the Client VPN endpoint.
  class ConnectionLogOptions
    # Indicates whether connection logging is enabled.
    property enabled : Bool | Nil

    # The name of the CloudWatch Logs log group. Required if connection logging is enabled.
    property cloudwatch_log_group : String | Nil

    # The name of the CloudWatch Logs log stream to which the connection data is published.
    property cloudwatch_log_stream : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @cloudwatch_log_group : String | Nil = nil,
      @cloudwatch_log_stream : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      if value = @cloudwatch_log_group
        params << {"#{prefix}CloudwatchLogGroup", value}
      end

      if value = @cloudwatch_log_stream
        params << {"#{prefix}CloudwatchLogStream", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
        cloudwatch_log_group: Core::XMLValue.string(node.xpath_node("*[local-name()='CloudwatchLogGroup']")),
        cloudwatch_log_stream: Core::XMLValue.string(node.xpath_node("*[local-name()='CloudwatchLogStream']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @cloudwatch_log_group, @cloudwatch_log_stream)
  end
end
