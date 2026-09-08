private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetInstanceTypesFromInstanceRequirementsRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The processor architecture type.
    property architecture_types : Array(ArchitectureType) = [] of ArchitectureType

    # The virtualization type.
    property virtualization_types : Array(VirtualizationType) = [] of VirtualizationType

    # The attributes required for the instance types.
    property instance_requirements : InstanceRequirementsRequest

    # The maximum number of items to return for this request. To get the next page of items, make
    # another request with the token returned in the output. For more information, see
    # [Pagination](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Query-Requests.html#api-pagination).
    property max_results : Int32 | Nil

    # The token returned from a previous paginated request. Pagination continues from the end of the
    # items returned by the previous request.
    property next_token : String | Nil

    # Reserved.
    property context : String | Nil

    def initialize(
      @architecture_types : Array(ArchitectureType),
      @virtualization_types : Array(VirtualizationType),
      @instance_requirements : InstanceRequirementsRequest,
      @dry_run : Bool | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
      @context : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      @architecture_types.each_with_index(1) do |item, i|
        params << {"#{prefix}ArchitectureType.#{i}", item.to_json_object_key}
      end

      @virtualization_types.each_with_index(1) do |item, i|
        params << {"#{prefix}VirtualizationType.#{i}", item.to_json_object_key}
      end

      params.concat(@instance_requirements.to_query_params("#{prefix}InstanceRequirements."))

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @context
        params << {"#{prefix}Context", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        architecture_types: node.xpath_nodes("*[local-name()='ArchitectureType']/*[local-name()='item']").compact_map { |n| AEC::ArchitectureType.from_json_object_key?(n.content) },
        virtualization_types: node.xpath_nodes("*[local-name()='VirtualizationType']/*[local-name()='item']").compact_map { |n| AEC::VirtualizationType.from_json_object_key?(n.content) },
        instance_requirements: node.xpath_node("*[local-name()='InstanceRequirements']").try { |n| InstanceRequirementsRequest.from_xml(n) }.not_nil!,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        context: Core::XMLValue.string(node.xpath_node("*[local-name()='Context']")),
      )
    end

    def validate! : Nil
      if value = @architecture_types
        raise Core::ValidationError.new("ArchitectureTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("ArchitectureTypes must have at most 3 item(s)") if value.size > 3
      end

      if value = @virtualization_types
        raise Core::ValidationError.new("VirtualizationTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("VirtualizationTypes must have at most 2 item(s)") if value.size > 2
      end

      if value = @instance_requirements
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @architecture_types, @virtualization_types, @instance_requirements, @max_results, @next_token, @context)
  end
end
