private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateIpamRoutingPolicyRegistrationRequest
    # Checks whether you have the required permissions for the operation, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM internet registry association.
    property ipam_internet_registry_association_id : String

    # The IP address prefix in CIDR notation to authorize in the ROA.
    property cidr : String

    # The Autonomous System Numbers (ASNs) authorized to originate the prefix.
    property asns : Array(String) = [] of String

    # Specifies whether to permit more specific route announcements than the CIDR prefix. When
    # enabled, ASNs can announce sub-prefixes of the authorized CIDR up to the specified maximum
    # length. Default: `false`.
    property permit_more_specific_announcements : Bool | Nil

    # The maximum prefix length that the ASNs are authorized to announce. Must be greater than or
    # equal to the prefix length of the CIDR. If not specified, defaults to the prefix length of the
    # CIDR (exact match only).
    property max_length : Int32 | Nil

    # A description for the routing policy registration.
    property description : String | Nil

    # Forces the creation of the routing policy registration even if it conflicts with an announced
    # route. Default: `false`.
    property force : Bool | Nil

    # A unique, case-sensitive identifier to ensure that the operation completes no more than one
    # time. If this token matches a previous request, the operation ignores the request, but does not
    # return an error.
    property client_token : String | Nil

    def initialize(
      @ipam_internet_registry_association_id : String,
      @cidr : String,
      @asns : Array(String),
      @dry_run : Bool | Nil = nil,
      @permit_more_specific_announcements : Bool | Nil = nil,
      @max_length : Int32 | Nil = nil,
      @description : String | Nil = nil,
      @force : Bool | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamInternetRegistryAssociationId", @ipam_internet_registry_association_id}

      params << {"#{prefix}Cidr", @cidr}

      @asns.each_with_index(1) do |item, i|
        params << {"#{prefix}Asn.#{i}", item}
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

      if value = @force
        params << {"#{prefix}Force", Core::QueryValue.bool(value)}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_internet_registry_association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamInternetRegistryAssociationId']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        asns: node.xpath_nodes("*[local-name()='Asn']/*[local-name()='item']").map { |n| n.content },
        permit_more_specific_announcements: Core::XMLValue.bool(node.xpath_node("*[local-name()='PermitMoreSpecificAnnouncements']")),
        max_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxLength']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        force: Core::XMLValue.bool(node.xpath_node("*[local-name()='Force']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @max_length
        raise Core::ValidationError.new("MaxLength value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxLength value must be <= 48") if value > 48
      end
    end

    def_equals_and_hash(@dry_run, @ipam_internet_registry_association_id, @cidr, @asns, @permit_more_specific_announcements, @max_length, @description, @force, @client_token)
  end
end
