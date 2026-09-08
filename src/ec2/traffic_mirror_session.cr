private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Traffic Mirror session.
  class TrafficMirrorSession
    # The ID for the Traffic Mirror session.
    property traffic_mirror_session_id : String | Nil

    # The ID of the Traffic Mirror target.
    property traffic_mirror_target_id : String | Nil

    # The ID of the Traffic Mirror filter.
    property traffic_mirror_filter_id : String | Nil

    # The ID of the Traffic Mirror session's network interface.
    property network_interface_id : String | Nil

    # The ID of the account that owns the Traffic Mirror session.
    property owner_id : String | Nil

    # The number of bytes in each packet to mirror. These are the bytes after the VXLAN header. To
    # mirror a subset, set this to the length (in bytes) to mirror. For example, if you set this value
    # to 100, then the first 100 bytes that meet the filter criteria are copied to the target. Do not
    # specify this parameter when you want to mirror the entire packet
    property packet_length : Int32 | Nil

    # The session number determines the order in which sessions are evaluated when an interface is
    # used by multiple sessions. The first session with a matching filter is the one that mirrors the
    # packets.
    #
    # Valid values are 1-32766.
    property session_number : Int32 | Nil

    # The virtual network ID associated with the Traffic Mirror session.
    property virtual_network_id : Int32 | Nil

    # The description of the Traffic Mirror session.
    property description : String | Nil

    # The tags assigned to the Traffic Mirror session.
    property tags : Array(Tag) | Nil

    def initialize(
      @traffic_mirror_session_id : String | Nil = nil,
      @traffic_mirror_target_id : String | Nil = nil,
      @traffic_mirror_filter_id : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @packet_length : Int32 | Nil = nil,
      @session_number : Int32 | Nil = nil,
      @virtual_network_id : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @traffic_mirror_session_id
        params << {"#{prefix}TrafficMirrorSessionId", value}
      end

      if value = @traffic_mirror_target_id
        params << {"#{prefix}TrafficMirrorTargetId", value}
      end

      if value = @traffic_mirror_filter_id
        params << {"#{prefix}TrafficMirrorFilterId", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
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

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        traffic_mirror_session_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorSessionId']")),
        traffic_mirror_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorTargetId']")),
        traffic_mirror_filter_id: Core::XMLValue.string(node.xpath_node("*[local-name()='trafficMirrorFilterId']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        packet_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='packetLength']")),
        session_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='sessionNumber']")),
        virtual_network_id: Core::XMLValue.i32(node.xpath_node("*[local-name()='virtualNetworkId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@traffic_mirror_session_id, @traffic_mirror_target_id, @traffic_mirror_filter_id, @network_interface_id, @owner_id, @packet_length, @session_number, @virtual_network_id, @description, @tags)
  end
end
