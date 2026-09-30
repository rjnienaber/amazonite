private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The architecture type, virtualization type, and other attributes for the instance types. When
  # you specify instance attributes, Amazon EC2 will identify instance types with those attributes.
  #
  # If you specify `InstanceRequirementsWithMetadataRequest`, you can't specify `InstanceTypes`.
  class InstanceRequirementsWithMetadataRequest
    # The architecture type.
    property architecture_types : Array(ArchitectureType) | Nil

    # The virtualization type.
    property virtualization_types : Array(VirtualizationType) | Nil

    # The attributes for the instance types. When you specify instance attributes, Amazon EC2 will
    # identify instance types with those attributes.
    property instance_requirements : InstanceRequirementsRequest | Nil

    def initialize(
      @architecture_types : Array(ArchitectureType) | Nil = nil,
      @virtualization_types : Array(VirtualizationType) | Nil = nil,
      @instance_requirements : InstanceRequirementsRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@architecture_types || [] of ArchitectureType).each_with_index(1) do |item, i|
        params << {"#{prefix}ArchitectureType.#{i}", item.to_json_object_key}
      end

      (@virtualization_types || [] of VirtualizationType).each_with_index(1) do |item, i|
        params << {"#{prefix}VirtualizationType.#{i}", item.to_json_object_key}
      end

      if value = @instance_requirements
        params.concat(value.to_query_params("#{prefix}InstanceRequirements."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        architecture_types: node.xpath_nodes("*[local-name()='ArchitectureType']/*[local-name()='item']").compact_map { |n| AEC::ArchitectureType.from_json_object_key?(n.content) },
        virtualization_types: node.xpath_nodes("*[local-name()='VirtualizationType']/*[local-name()='item']").compact_map { |n| AEC::VirtualizationType.from_json_object_key?(n.content) },
        instance_requirements: node.xpath_node("*[local-name()='InstanceRequirements']").try { |n| InstanceRequirementsRequest.from_xml(n) },
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

    def_equals_and_hash(@architecture_types, @virtualization_types, @instance_requirements)
  end
end
