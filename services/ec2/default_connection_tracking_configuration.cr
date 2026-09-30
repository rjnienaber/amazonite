private alias Core = Amazonite::Core

module Amazonite::EC2
  # Indicates default conntrack information for the instance type. For more information, see [
  # Connection tracking timeouts
  # ](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#connection-tracking-timeouts)
  # in the Amazon EC2 User Guide.
  class DefaultConnectionTrackingConfiguration
    # Default timeout (in seconds) for idle TCP connections in an established state.
    property default_tcp_established_timeout : Int32 | Nil

    # Default timeout (in seconds) for idle UDP flows that have seen traffic only in a single
    # direction or a single request-response transaction.
    property default_udp_timeout : Int32 | Nil

    # Default timeout (in seconds) for idle UDP flows classified as streams which have seen more than
    # one request-response transaction.
    property default_udp_stream_timeout : Int32 | Nil

    def initialize(
      @default_tcp_established_timeout : Int32 | Nil = nil,
      @default_udp_timeout : Int32 | Nil = nil,
      @default_udp_stream_timeout : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @default_tcp_established_timeout
        params << {"#{prefix}DefaultTcpEstablishedTimeout", value.to_s}
      end

      if value = @default_udp_timeout
        params << {"#{prefix}DefaultUdpTimeout", value.to_s}
      end

      if value = @default_udp_stream_timeout
        params << {"#{prefix}DefaultUdpStreamTimeout", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        default_tcp_established_timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultTcpEstablishedTimeout']")),
        default_udp_timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultUdpTimeout']")),
        default_udp_stream_timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='defaultUdpStreamTimeout']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@default_tcp_established_timeout, @default_udp_timeout, @default_udp_stream_timeout)
  end
end
