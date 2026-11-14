private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Specifies a scope of network resources for a scope-based policy association.
  class FlexCostAllocationNetworkResourceScope
    # The type of scope. This parameter is required. Valid values are `account`, `vpc`, and `subnet`.
    property resource_type : FlexCostAllocationNetworkResourceScopeType

    # The IDs of the resources owned by you that define the scope. You can specify from 1 to 20 IDs.
    # This parameter is required.
    property resource_ids : Array(String) = [] of String

    def initialize(
      @resource_type : FlexCostAllocationNetworkResourceScopeType,
      @resource_ids : Array(String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ResourceType", @resource_type.to_json_object_key}

      @resource_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceIds.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        resource_type: ((n = node.xpath_node("*[local-name()='ResourceType']")) ? AEC::FlexCostAllocationNetworkResourceScopeType.from_json_object_key?(n.content) : nil).not_nil!,
        resource_ids: node.xpath_nodes("*[local-name()='ResourceIds']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
      if value = @resource_ids
        raise Core::ValidationError.new("ResourceIds must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ResourceIds must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@resource_type, @resource_ids)
  end
end
