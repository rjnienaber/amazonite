private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a managed prefix list.
  class ManagedPrefixList
    # The ID of the prefix list.
    property prefix_list_id : String | Nil

    # The IP address version.
    property address_family : String | Nil

    # The current state of the prefix list.
    property state : PrefixListState | Nil

    # The state message.
    property state_message : String | Nil

    # The Amazon Resource Name (ARN) for the prefix list.
    property prefix_list_arn : String | Nil

    # The name of the prefix list.
    property prefix_list_name : String | Nil

    # The maximum number of entries for the prefix list.
    property max_entries : Int32 | Nil

    # The version of the prefix list.
    property version : Int64 | Nil

    # The tags for the prefix list.
    property tags : Array(Tag) | Nil

    # The ID of the owner of the prefix list.
    property owner_id : String | Nil

    # The ID of the IPAM prefix list resolver target associated with this managed prefix list. When
    # set, this prefix list becomes an IPAM managed prefix list.
    #
    # An IPAM-managed prefix list is a customer-managed prefix list that has been associated with an
    # IPAM prefix list resolver target. When a prefix list becomes IPAM managed, its CIDRs are
    # automatically synchronized based on the IPAM prefix list resolver's CIDR selection rules, and
    # direct CIDR modifications are restricted.
    property ipam_prefix_list_resolver_target_id : String | Nil

    # Indicates whether synchronization with an IPAM prefix list resolver is enabled for this managed
    # prefix list. When enabled, the prefix list CIDRs are automatically updated based on the
    # resolver's CIDR selection rules.
    property ipam_prefix_list_resolver_sync_enabled : Bool | Nil

    def initialize(
      @prefix_list_id : String | Nil = nil,
      @address_family : String | Nil = nil,
      @state : PrefixListState | Nil = nil,
      @state_message : String | Nil = nil,
      @prefix_list_arn : String | Nil = nil,
      @prefix_list_name : String | Nil = nil,
      @max_entries : Int32 | Nil = nil,
      @version : Int64 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @owner_id : String | Nil = nil,
      @ipam_prefix_list_resolver_target_id : String | Nil = nil,
      @ipam_prefix_list_resolver_sync_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @address_family
        params << {"#{prefix}AddressFamily", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      if value = @prefix_list_arn
        params << {"#{prefix}PrefixListArn", value}
      end

      if value = @prefix_list_name
        params << {"#{prefix}PrefixListName", value}
      end

      if value = @max_entries
        params << {"#{prefix}MaxEntries", value.to_s}
      end

      if value = @version
        params << {"#{prefix}Version", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @ipam_prefix_list_resolver_target_id
        params << {"#{prefix}IpamPrefixListResolverTargetId", value}
      end

      if value = @ipam_prefix_list_resolver_sync_enabled
        params << {"#{prefix}IpamPrefixListResolverSyncEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        address_family: Core::XMLValue.string(node.xpath_node("*[local-name()='addressFamily']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::PrefixListState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        prefix_list_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListArn']")),
        prefix_list_name: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListName']")),
        max_entries: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxEntries']")),
        version: Core::XMLValue.i64(node.xpath_node("*[local-name()='version']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        ipam_prefix_list_resolver_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPrefixListResolverTargetId']")),
        ipam_prefix_list_resolver_sync_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='ipamPrefixListResolverSyncEnabled']")),
      )
    end

    def validate! : Nil
      if value = @prefix_list_arn
        raise Core::ValidationError.new("PrefixListArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PrefixListArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@prefix_list_id, @address_family, @state, @state_message, @prefix_list_arn, @prefix_list_name, @max_entries, @version, @tags, @owner_id, @ipam_prefix_list_resolver_target_id, @ipam_prefix_list_resolver_sync_enabled)
  end
end
