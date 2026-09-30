private alias Core = Amazonite::Core

module Amazonite::EC2
  # A security group connection tracking specification request that enables you to set the idle
  # timeout for connection tracking on an Elastic network interface. For more information, see
  # [Connection tracking
  # timeouts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#connection-tracking-timeouts)
  # in the *Amazon EC2 User Guide*.
  class ConnectionTrackingSpecificationRequest
    # Timeout (in seconds) for idle TCP connections in an established state. Min: 60 seconds. Max:
    # 432000 seconds (5 days). Default: 350 seconds for Nitro v6 instance types (excluding P6e-GB200);
    # 432000 seconds for all other instance types (including P6e-GB200). Recommended: Less than 432000
    # seconds.
    property tcp_established_timeout : Int32 | Nil

    # Timeout (in seconds) for idle UDP flows classified as streams which have seen more than one
    # request-response transaction. Min: 60 seconds. Max: 180 seconds (3 minutes). Default: 180
    # seconds.
    property udp_stream_timeout : Int32 | Nil

    # Timeout (in seconds) for idle UDP flows that have seen traffic only in a single direction or a
    # single request-response transaction. Min: 30 seconds. Max: 60 seconds. Default: 30 seconds.
    property udp_timeout : Int32 | Nil

    def initialize(
      @tcp_established_timeout : Int32 | Nil = nil,
      @udp_stream_timeout : Int32 | Nil = nil,
      @udp_timeout : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @tcp_established_timeout
        params << {"#{prefix}TcpEstablishedTimeout", value.to_s}
      end

      if value = @udp_stream_timeout
        params << {"#{prefix}UdpStreamTimeout", value.to_s}
      end

      if value = @udp_timeout
        params << {"#{prefix}UdpTimeout", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tcp_established_timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='TcpEstablishedTimeout']")),
        udp_stream_timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='UdpStreamTimeout']")),
        udp_timeout: Core::XMLValue.i32(node.xpath_node("*[local-name()='UdpTimeout']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@tcp_established_timeout, @udp_stream_timeout, @udp_timeout)
  end
end
