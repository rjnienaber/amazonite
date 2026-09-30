private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a routing policy registration that represents a Route Origin
  # Authorization (ROA) managed through IPAM.
  class IpamRoutingPolicyRegistration
    # The IP address prefix in CIDR notation authorized by the ROA.
    property cidr : String | Nil

    # The Autonomous System Numbers (ASNs) authorized to originate the prefix.
    property asns : Array(String) | Nil

    # Specifies whether to permit more specific route announcements than the CIDR prefix. When
    # enabled, ASNs can announce sub-prefixes of the authorized CIDR up to the specified maximum
    # length. Default: `false`.
    property permit_more_specific_announcements : Bool | Nil

    # The maximum prefix length that the ASNs are authorized to announce.
    property max_length : Int32 | Nil

    # The description of the routing policy registration.
    property description : String | Nil

    # The ID of the most recent delta that modified this registration.
    property latest_delta_id : String | Nil

    # The state of the routing policy registration. Valid values: `pending-activate` |
    # `activate-failed` | `create-in-progress` | `create-complete` | `update-in-progress` |
    # `update-complete` | `delete-in-progress` | `delete-complete`.
    property state : IpamRoutingPolicyRegistrationState | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @asns : Array(String) | Nil = nil,
      @permit_more_specific_announcements : Bool | Nil = nil,
      @max_length : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @latest_delta_id : String | Nil = nil,
      @state : IpamRoutingPolicyRegistrationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      (@asns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AsnSet.#{i}", item}
      end

      if value = @permit_more_specific_announcements
        params << {"#{prefix}PermitMoreSpecificAnnouncements", Core::QueryValue.bool(value)}
      end

      if value = @max_length
        params << {"#{prefix}MaxLength", value.to_s}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @latest_delta_id
        params << {"#{prefix}LatestDeltaId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        asns: node.xpath_nodes("*[local-name()='asnSet']/*[local-name()='item']").map { |n| n.content },
        permit_more_specific_announcements: Core::XMLValue.bool(node.xpath_node("*[local-name()='permitMoreSpecificAnnouncements']")),
        max_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxLength']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        latest_delta_id: Core::XMLValue.string(node.xpath_node("*[local-name()='latestDeltaId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamRoutingPolicyRegistrationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @max_length
        raise Core::ValidationError.new("MaxLength value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxLength value must be <= 48") if value > 48
      end
    end

    def_equals_and_hash(@cidr, @asns, @permit_more_specific_announcements, @max_length, @description, @latest_delta_id, @state)
  end
end
