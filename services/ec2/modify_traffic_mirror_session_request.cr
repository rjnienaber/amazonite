private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyTrafficMirrorSessionRequest
    # The ID of the Traffic Mirror session.
    property traffic_mirror_session_id : String

    # The Traffic Mirror target. The target must be in the same VPC as the source, or have a VPC
    # peering connection with the source.
    property traffic_mirror_target_id : String | Nil

    # The ID of the Traffic Mirror filter.
    property traffic_mirror_filter_id : String | Nil

    # The number of bytes in each packet to mirror. These are bytes after the VXLAN header. To mirror
    # a subset, set this to the length (in bytes) to mirror. For example, if you set this value to
    # 100, then the first 100 bytes that meet the filter criteria are copied to the target. Do not
    # specify this parameter when you want to mirror the entire packet.
    #
    # For sessions with Network Load Balancer (NLB) traffic mirror targets, the default `PacketLength`
    # will be set to 8500. Valid values are 1-8500. Setting a `PacketLength` greater than 8500 will
    # result in an error response.
    property packet_length : Int32 | Nil

    # The session number determines the order in which sessions are evaluated when an interface is
    # used by multiple sessions. The first session with a matching filter is the one that mirrors the
    # packets.
    #
    # Valid values are 1-32766.
    property session_number : Int32 | Nil

    # The virtual network ID of the Traffic Mirror session.
    property virtual_network_id : Int32 | Nil

    # The description to assign to the Traffic Mirror session.
    property description : String | Nil

    # The properties that you want to remove from the Traffic Mirror session.
    #
    # When you remove a property from a Traffic Mirror session, the property is set to the default.
    property remove_fields : Array(TrafficMirrorSessionField) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @traffic_mirror_session_id : String,
      @traffic_mirror_target_id : String | Nil = nil,
      @traffic_mirror_filter_id : String | Nil = nil,
      @packet_length : Int32 | Nil = nil,
      @session_number : Int32 | Nil = nil,
      @virtual_network_id : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @remove_fields : Array(TrafficMirrorSessionField) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TrafficMirrorSessionId", @traffic_mirror_session_id}

      if value = @traffic_mirror_target_id
        params << {"#{prefix}TrafficMirrorTargetId", value}
      end

      if value = @traffic_mirror_filter_id
        params << {"#{prefix}TrafficMirrorFilterId", value}
      end

      if value = @packet_length
        params << {"#{prefix}PacketLength", value.to_s}
      end

      if value = @session_number
        params << {"#{prefix}SessionNumber", value.to_s}
      end

      if value = @virtual_network_id
        params << {"#{prefix}VirtualNetworkId", value.to_s}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@remove_fields || [] of TrafficMirrorSessionField).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveField.#{i}", item.to_json_object_key}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_session_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorSessionId']")).not_nil!,
        traffic_mirror_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorTargetId']")),
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TrafficMirrorFilterId']")),
        packet_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='PacketLength']")),
        session_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='SessionNumber']")),
        virtual_network_id: Core::XMLValue.i32(node.xpath_node("*[local-name()='VirtualNetworkId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        remove_fields: node.xpath_nodes("*[local-name()='RemoveField']/*[local-name()='item']").compact_map { |n| AEC::TrafficMirrorSessionField.from_json_object_key?(n.content) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@traffic_mirror_session_id, @traffic_mirror_target_id, @traffic_mirror_filter_id, @packet_length, @session_number, @virtual_network_id, @description, @remove_fields, @dry_run)
  end
end
