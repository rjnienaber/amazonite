private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAddressesAttributeRequest
    # [EC2-VPC] The allocation IDs.
    property allocation_ids : Array(String) | Nil

    # The attribute of the IP address.
    property attribute : AddressAttributeName | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @allocation_ids : Array(String) | Nil = nil,
      @attribute : AddressAttributeName | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@allocation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AllocationId.#{i}", item}
      end

      if value = @attribute
        params << {"#{prefix}Attribute", value.to_json_object_key}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allocation_ids: node.xpath_nodes("*[local-name()='AllocationId']/*[local-name()='item']").map { |n| n.content },
        attribute: (n = node.xpath_node("*[local-name()='Attribute']")) ? AEC::AddressAttributeName.from_json_object_key?(n.content) : nil,
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@allocation_ids, @attribute, @next_token, @max_results, @dry_run)
  end
end
