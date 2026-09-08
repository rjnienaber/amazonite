private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTrafficMirrorSessionRequest
    # The ID of the source network interface.
    property network_interface_id : String

    # The ID of the Traffic Mirror target.
    property traffic_mirror_target_id : String

    # The ID of the Traffic Mirror filter.
    property traffic_mirror_filter_id : String

    # The number of bytes in each packet to mirror. These are bytes after the VXLAN header. Do not
    # specify this parameter when you want to mirror the entire packet. To mirror a subset of the
    # packet, set this to the length (in bytes) that you want to mirror. For example, if you set this
    # value to 100, then the first 100 bytes that meet the filter criteria are copied to the target.
    #
    # If you do not want to mirror the entire packet, use the `PacketLength` parameter to specify the
    # number of bytes in each packet to mirror.
    #
    # For sessions with Network Load Balancer (NLB) Traffic Mirror targets the default `PacketLength`
    # will be set to 8500. Valid values are 1-8500. Setting a `PacketLength` greater than 8500 will
    # result in an error response.
    property packet_length : Int32 | Nil

    # The session number determines the order in which sessions are evaluated when an interface is
    # used by multiple sessions. The first session with a matching filter is the one that mirrors the
    # packets.
    #
    # Valid values are 1-32766.
    property session_number : Int32

    # The VXLAN ID for the Traffic Mirror session. For more information about the VXLAN protocol, see
    # [RFC 7348](https://datatracker.ietf.org/doc/html/rfc7348). If you do not specify a
    # `VirtualNetworkId`, an account-wide unique ID is chosen at random.
    property virtual_network_id : Int32 | Nil

    # The description of the Traffic Mirror session.
    property description : String | Nil

    # The tags to assign to a Traffic Mirror session.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [How to ensure
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    def initialize(
      @network_interface_id : String,
      @traffic_mirror_target_id : String,
      @traffic_mirror_filter_id : String,
      @session_number : Int32,
      @packet_length : Int32 | Nil = nil,
      @virtual_network_id : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      params << {"#{prefix}TrafficMirrorTargetId", @traffic_mirror_target_id}

      params << {"#{prefix}TrafficMirrorFilterId", @traffic_mirror_filter_id}

      if value = @packet_length
        params << {"#{prefix}PacketLength", value.to_s}
      end

      params << {"#{prefix}SessionNumber", @session_number.to_s}

      if value = @virtual_network_id
        params << {"#{prefix}VirtualNetworkId", value.to_s}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")).not_nil!,
        traffic_mirror_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorTargetId']")).not_nil!,
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorFilterId']")).not_nil!,
        packet_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='PacketLength']")),
        session_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionNumber']")).not_nil!,
        virtual_network_id: Core::XMLValue.i32(node.xpath_node("*[local-name()='VirtualNetworkId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_interface_id, @traffic_mirror_target_id, @traffic_mirror_filter_id, @packet_length, @session_number, @virtual_network_id, @description, @tag_specifications, @dry_run, @client_token)
  end
end
