private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateManagedPrefixListRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # A name for the prefix list.
    #
    # Constraints: Up to 255 characters in length. The name cannot start with `com.amazonaws`.
    property prefix_list_name : String

    # One or more entries for the prefix list.
    property entries : Array(AddPrefixListEntry) | Nil

    # The maximum number of entries for the prefix list.
    property max_entries : Int32

    # The tags to apply to the prefix list during creation.
    property tag_specifications : Array(TagSpecification) | Nil

    # The IP address type.
    #
    # Valid Values: `IPv4` | `IPv6`
    property address_family : String

    # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. For more
    # information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    #
    # Constraints: Up to 255 UTF-8 characters in length.
    property client_token : String | Nil

    def initialize(
      @prefix_list_name : String,
      @max_entries : Int32,
      @address_family : String,
      @dry_run : Bool | Nil = nil,
      @entries : Array(AddPrefixListEntry) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}PrefixListName", @prefix_list_name}

      (@entries || [] of AddPrefixListEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Entry.#{i}."))
      end

      params << {"#{prefix}MaxEntries", @max_entries.to_s}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      params << {"#{prefix}AddressFamily", @address_family}

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        prefix_list_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixListName']")).not_nil!,
        entries: node.xpath_nodes("*[local-name()='Entry']/*[local-name()='item']").map { |n| AddPrefixListEntry.from_xml(n) },
        max_entries: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxEntries']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        address_family: Core::XMLValue.string(node.xpath_node("*[local-name()='AddressFamily']")).not_nil!,
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
      )
    end

    def validate! : Nil
      if value = @entries
        raise Core::ValidationError.new("Entries must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Entries must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @prefix_list_name, @entries, @max_entries, @tag_specifications, @address_family, @client_token)
  end
end
