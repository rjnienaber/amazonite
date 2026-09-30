private alias Core = Amazonite::Core

module Amazonite::EC2
  # Options for sending VPN tunnel logs to CloudWatch.
  class CloudWatchLogOptionsSpecification
    # Enable or disable VPN tunnel logging feature. Default value is `False`.
    #
    # Valid values: `True` | `False`
    property log_enabled : Bool | Nil

    # The Amazon Resource Name (ARN) of the CloudWatch log group to send logs to.
    property log_group_arn : String | Nil

    # Set log format. Default format is `json`.
    #
    # Valid values: `json` | `text`
    property log_output_format : String | Nil

    # Specifies whether to enable BGP logging for the VPN connection. Default value is `False`.
    #
    # Valid values: `True` | `False`
    property bgp_log_enabled : Bool | Nil

    # The Amazon Resource Name (ARN) of the CloudWatch log group where BGP logs will be sent.
    property bgp_log_group_arn : String | Nil

    # The desired output format for BGP logs to be sent to CloudWatch. Default format is `json`.
    #
    # Valid values: `json` | `text`
    property bgp_log_output_format : String | Nil

    def initialize(
      @log_enabled : Bool | Nil = nil,
      @log_group_arn : String | Nil = nil,
      @log_output_format : String | Nil = nil,
      @bgp_log_enabled : Bool | Nil = nil,
      @bgp_log_group_arn : String | Nil = nil,
      @bgp_log_output_format : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @log_enabled
        params << {"#{prefix}LogEnabled", Core::QueryValue.bool(value)}
      end

      if value = @log_group_arn
        params << {"#{prefix}LogGroupArn", value}
      end

      if value = @log_output_format
        params << {"#{prefix}LogOutputFormat", value}
      end

      if value = @bgp_log_enabled
        params << {"#{prefix}BgpLogEnabled", Core::QueryValue.bool(value)}
      end

      if value = @bgp_log_group_arn
        params << {"#{prefix}BgpLogGroupArn", value}
      end

      if value = @bgp_log_output_format
        params << {"#{prefix}BgpLogOutputFormat", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        log_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='LogEnabled']")),
        log_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='LogGroupArn']")),
        log_output_format: Core::XMLValue.string(node.xpath_node("*[local-name()='LogOutputFormat']")),
        bgp_log_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='BgpLogEnabled']")),
        bgp_log_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='BgpLogGroupArn']")),
        bgp_log_output_format: Core::XMLValue.string(node.xpath_node("*[local-name()='BgpLogOutputFormat']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@log_enabled, @log_group_arn, @log_output_format, @bgp_log_enabled, @bgp_log_group_arn, @bgp_log_output_format)
  end
end
