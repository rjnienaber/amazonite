private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPAM prefix list resolver.
  #
  # An IPAM prefix list resolver is a component that manages the synchronization between IPAM's CIDR
  # selection rules and customer-managed prefix lists. It automates connectivity configurations by
  # selecting CIDRs from IPAM's database based on your business logic and synchronizing them with
  # prefix lists used in resources such as VPC route tables and security groups.
  class IpamPrefixListResolver
    # The ID of the Amazon Web Services account that owns the IPAM prefix list resolver.
    property owner_id : String | Nil

    # The ID of the IPAM prefix list resolver.
    property ipam_prefix_list_resolver_id : String | Nil

    # The Amazon Resource Name (ARN) of the IPAM prefix list resolver.
    property ipam_prefix_list_resolver_arn : String | Nil

    # The Amazon Resource Name (ARN) of the IPAM associated with this resolver.
    property ipam_arn : String | Nil

    # The Amazon Web Services Region where the associated IPAM is located.
    property ipam_region : String | Nil

    # The description of the IPAM prefix list resolver.
    property description : String | Nil

    # The address family (IPv4 or IPv6) for the IPAM prefix list resolver.
    property address_family : AddressFamily | Nil

    # The current state of the IPAM prefix list resolver. Valid values include `create-in-progress`,
    # `create-complete`, `create-failed`, `modify-in-progress`, `modify-complete`, `modify-failed`,
    # `delete-in-progress`, `delete-complete`, and `delete-failed`.
    property state : IpamPrefixListResolverState | Nil

    # The tags assigned to the IPAM prefix list resolver.
    property tags : Array(Tag) | Nil

    # The status for the last time a version was created.
    #
    # Each version is a snapshot of what CIDRs matched your rules at that moment in time. The version
    # number increments every time the CIDR list changes due to infrastructure changes.
    property last_version_creation_status : IpamPrefixListResolverVersionCreationStatus | Nil

    # The status message for the last time a version was created.
    #
    # Each version is a snapshot of what CIDRs matched your rules at that moment in time. The version
    # number increments every time the CIDR list changes due to infrastructure changes.
    property last_version_creation_status_message : String | Nil

    def initialize(
      @owner_id : String | Nil = nil,
      @ipam_prefix_list_resolver_id : String | Nil = nil,
      @ipam_prefix_list_resolver_arn : String | Nil = nil,
      @ipam_arn : String | Nil = nil,
      @ipam_region : String | Nil = nil,
      @description : String | Nil = nil,
      @address_family : AddressFamily | Nil = nil,
      @state : IpamPrefixListResolverState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @last_version_creation_status : IpamPrefixListResolverVersionCreationStatus | Nil = nil,
      @last_version_creation_status_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_prefix_list_resolver_id
        params << {"#{prefix}IpamPrefixListResolverId", value}
      end

      if value = @ipam_prefix_list_resolver_arn
        params << {"#{prefix}IpamPrefixListResolverArn", value}
      end

      if value = @ipam_arn
        params << {"#{prefix}IpamArn", value}
      end

      if value = @ipam_region
        params << {"#{prefix}IpamRegion", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @address_family
        params << {"#{prefix}AddressFamily", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @last_version_creation_status
        params << {"#{prefix}LastVersionCreationStatus", value.to_json_object_key}
      end

      if value = @last_version_creation_status_message
        params << {"#{prefix}LastVersionCreationStatusMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_prefix_list_resolver_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPrefixListResolverId']")),
        ipam_prefix_list_resolver_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPrefixListResolverArn']")),
        ipam_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamArn']")),
        ipam_region: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamRegion']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        address_family: (n = node.xpath_node("*[local-name()='addressFamily']")) ? AEC::AddressFamily.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamPrefixListResolverState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        last_version_creation_status: (n = node.xpath_node("*[local-name()='lastVersionCreationStatus']")) ? AEC::IpamPrefixListResolverVersionCreationStatus.from_json_object_key?(n.content) : nil,
        last_version_creation_status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='lastVersionCreationStatusMessage']")),
      )
    end

    def validate! : Nil
      if value = @ipam_prefix_list_resolver_arn
        raise Core::ValidationError.new("IpamPrefixListResolverArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamPrefixListResolverArn length must be <= 1283") if value.size > 1283
      end

      if value = @ipam_arn
        raise Core::ValidationError.new("IpamArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@owner_id, @ipam_prefix_list_resolver_id, @ipam_prefix_list_resolver_arn, @ipam_arn, @ipam_region, @description, @address_family, @state, @tags, @last_version_creation_status, @last_version_creation_status_message)
  end
end
