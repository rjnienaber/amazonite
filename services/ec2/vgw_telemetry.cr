private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes telemetry for a VPN tunnel.
  class VgwTelemetry
    # The number of accepted routes.
    property accepted_route_count : Int32 | Nil

    # The date and time of the last change in status. This field is updated when changes in IKE (Phase
    # 1), IPSec (Phase 2), or BGP status are detected.
    property last_status_change : Time | Nil

    # The Internet-routable IP address of the virtual private gateway's outside interface.
    property outside_ip_address : String | Nil

    # The status of the VPN tunnel.
    property status : TelemetryStatus | Nil

    # If an error occurs, a description of the error.
    property status_message : String | Nil

    # The Amazon Resource Name (ARN) of the VPN tunnel endpoint certificate.
    property certificate_arn : String | Nil

    def initialize(
      @accepted_route_count : Int32 | Nil = nil,
      @last_status_change : Time | Nil = nil,
      @outside_ip_address : String | Nil = nil,
      @status : TelemetryStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @certificate_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @accepted_route_count
        params << {"#{prefix}AcceptedRouteCount", value.to_s}
      end

      if value = @last_status_change
        params << {"#{prefix}LastStatusChange", Core::QueryValue.time(value)}
      end

      if value = @outside_ip_address
        params << {"#{prefix}OutsideIpAddress", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @certificate_arn
        params << {"#{prefix}CertificateArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accepted_route_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='acceptedRouteCount']")),
        last_status_change: Core::XMLValue.time(node.xpath_node("*[local-name()='lastStatusChange']")),
        outside_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='outsideIpAddress']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::TelemetryStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        certificate_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='certificateArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@accepted_route_count, @last_status_change, @outside_ip_address, @status, @status_message, @certificate_arn)
  end
end
