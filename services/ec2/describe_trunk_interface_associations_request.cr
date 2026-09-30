private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTrunkInterfaceAssociationsRequest
    # The IDs of the associations.
    property association_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # One or more filters.
    #
    # - `gre-key` - The ID of a trunk interface association.
    #
    # - `interface-protocol` - The interface protocol. Valid values are `VLAN` and `GRE`.
    property filters : Array(Filter) | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    # The maximum number of results to return with a single call. To retrieve the remaining results,
    # make another call with the returned `nextToken` value.
    property max_results : Int32 | Nil

    def initialize(
      @association_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@association_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AssociationId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_ids: node.xpath_nodes("*[local-name()='AssociationId']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 255") if value > 255
      end
    end

    def_equals_and_hash(@association_ids, @dry_run, @filters, @next_token, @max_results)
  end
end
