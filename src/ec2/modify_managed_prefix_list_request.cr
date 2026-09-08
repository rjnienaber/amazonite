private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyManagedPrefixListRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the prefix list.
    property prefix_list_id : String

    # The current version of the prefix list.
    property current_version : Int64 | Nil

    # A name for the prefix list.
    property prefix_list_name : String | Nil

    # One or more entries to add to the prefix list.
    property add_entries : Array(AddPrefixListEntry) | Nil

    # One or more entries to remove from the prefix list.
    property remove_entries : Array(RemovePrefixListEntry) | Nil

    # The maximum number of entries for the prefix list. You cannot modify the entries of a prefix
    # list and modify the size of a prefix list at the same time.
    #
    # If any of the resources that reference the prefix list cannot support the new maximum size, the
    # modify operation fails. Check the state message for the IDs of the first ten resources that do
    # not support the new maximum size.
    property max_entries : Int32 | Nil

    # Indicates whether synchronization with an IPAM prefix list resolver should be enabled for this
    # managed prefix list. When enabled, the prefix list CIDRs are automatically updated based on the
    # associated resolver's CIDR selection rules.
    property ipam_prefix_list_resolver_sync_enabled : Bool | Nil

    def initialize(
      @prefix_list_id : String,
      @dry_run : Bool | Nil = nil,
      @current_version : Int64 | Nil = nil,
      @prefix_list_name : String | Nil = nil,
      @add_entries : Array(AddPrefixListEntry) | Nil = nil,
      @remove_entries : Array(RemovePrefixListEntry) | Nil = nil,
      @max_entries : Int32 | Nil = nil,
      @ipam_prefix_list_resolver_sync_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}PrefixListId", @prefix_list_id}

      if value = @current_version
        params << {"#{prefix}CurrentVersion", value.to_s}
      end

      if value = @prefix_list_name
        params << {"#{prefix}PrefixListName", value}
      end

      (@add_entries || [] of AddPrefixListEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AddEntry.#{i}."))
      end

      (@remove_entries || [] of RemovePrefixListEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RemoveEntry.#{i}."))
      end

      if value = @max_entries
        params << {"#{prefix}MaxEntries", value.to_s}
      end

      if value = @ipam_prefix_list_resolver_sync_enabled
        params << {"#{prefix}IpamPrefixListResolverSyncEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixListId']")).not_nil!,
        current_version: Core::XMLValue.i64(node.xpath_node("*[local-name()='CurrentVersion']")),
        prefix_list_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixListName']")),
        add_entries: node.xpath_nodes("*[local-name()='AddEntry']/*[local-name()='item']").map { |n| AddPrefixListEntry.from_xml(n) },
        remove_entries: node.xpath_nodes("*[local-name()='RemoveEntry']/*[local-name()='item']").map { |n| RemovePrefixListEntry.from_xml(n) },
        max_entries: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxEntries']")),
        ipam_prefix_list_resolver_sync_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='IpamPrefixListResolverSyncEnabled']")),
      )
    end

    def validate! : Nil
      if value = @add_entries
        raise Core::ValidationError.new("AddEntries must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AddEntries must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @remove_entries
        raise Core::ValidationError.new("RemoveEntries must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("RemoveEntries must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @prefix_list_id, @current_version, @prefix_list_name, @add_entries, @remove_entries, @max_entries, @ipam_prefix_list_resolver_sync_enabled)
  end
end
