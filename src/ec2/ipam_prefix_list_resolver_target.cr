private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPAM prefix list resolver target.
  #
  # An IPAM prefix list resolver target is an association between a specific customer-managed prefix
  # list and an IPAM prefix list resolver. The target enables the resolver to synchronize CIDRs
  # selected by its rules into the specified prefix list, which can then be referenced in Amazon Web
  # Services resources.
  class IpamPrefixListResolverTarget
    # The ID of the IPAM prefix list resolver target.
    property ipam_prefix_list_resolver_target_id : String | Nil

    # The Amazon Resource Name (ARN) of the IPAM prefix list resolver target.
    property ipam_prefix_list_resolver_target_arn : String | Nil

    # The ID of the IPAM prefix list resolver associated with this target.
    property ipam_prefix_list_resolver_id : String | Nil

    # The ID of the Amazon Web Services account that owns the IPAM prefix list resolver target.
    property owner_id : String | Nil

    # The ID of the managed prefix list associated with this target.
    property prefix_list_id : String | Nil

    # The Amazon Web Services Region where the prefix list associated with this target is located.
    property prefix_list_region : String | Nil

    # The desired version of the prefix list that this target should synchronize with.
    property desired_version : Int64 | Nil

    # The version of the prefix list that was last successfully synchronized by this target.
    property last_synced_version : Int64 | Nil

    # Indicates whether this target automatically tracks the latest version of the prefix list.
    property track_latest_version : Bool | Nil

    # A message describing the current state of the IPAM prefix list resolver target, including any
    # error information.
    property state_message : String | Nil

    # The current state of the IPAM prefix list resolver target. Valid values include
    # `create-in-progress`, `create-complete`, `create-failed`, `modify-in-progress`,
    # `modify-complete`, `modify-failed`, `delete-in-progress`, `delete-complete`, and
    # `delete-failed`.
    property state : IpamPrefixListResolverTargetState | Nil

    # The tags assigned to the IPAM prefix list resolver target.
    property tags : Array(Tag) | Nil

    def initialize(
      @ipam_prefix_list_resolver_target_id : String | Nil = nil,
      @ipam_prefix_list_resolver_target_arn : String | Nil = nil,
      @ipam_prefix_list_resolver_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @prefix_list_region : String | Nil = nil,
      @desired_version : Int64 | Nil = nil,
      @last_synced_version : Int64 | Nil = nil,
      @track_latest_version : Bool | Nil = nil,
      @state_message : String | Nil = nil,
      @state : IpamPrefixListResolverTargetState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_prefix_list_resolver_target_id
        params << {"#{prefix}IpamPrefixListResolverTargetId", value}
      end

      if value = @ipam_prefix_list_resolver_target_arn
        params << {"#{prefix}IpamPrefixListResolverTargetArn", value}
      end

      if value = @ipam_prefix_list_resolver_id
        params << {"#{prefix}IpamPrefixListResolverId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @prefix_list_region
        params << {"#{prefix}PrefixListRegion", value}
      end

      if value = @desired_version
        params << {"#{prefix}DesiredVersion", value.to_s}
      end

      if value = @last_synced_version
        params << {"#{prefix}LastSyncedVersion", value.to_s}
      end

      if value = @track_latest_version
        params << {"#{prefix}TrackLatestVersion", Core::QueryValue.bool(value)}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_prefix_list_resolver_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPrefixListResolverTargetId']")),
        ipam_prefix_list_resolver_target_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPrefixListResolverTargetArn']")),
        ipam_prefix_list_resolver_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ipamPrefixListResolverId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        prefix_list_region: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListRegion']")),
        desired_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='desiredVersion']")),
        last_synced_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='lastSyncedVersion']")),
        track_latest_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='trackLatestVersion']")),
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamPrefixListResolverTargetState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_prefix_list_resolver_target_arn
        raise Core::ValidationError.new("IpamPrefixListResolverTargetArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("IpamPrefixListResolverTargetArn length must be <= 1283") if value.size > 1283
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_prefix_list_resolver_target_id, @ipam_prefix_list_resolver_target_arn, @ipam_prefix_list_resolver_id, @owner_id, @prefix_list_id, @prefix_list_region, @desired_version, @last_synced_version, @track_latest_version, @state_message, @state, @tags)
  end
end
