private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the modification request/s.
  class ReservedInstancesModificationResult
    # The ID for the Reserved Instances that were created as part of the modification request. This
    # field is only available when the modification is fulfilled.
    property reserved_instances_id : String | Nil

    # The target Reserved Instances configurations supplied as part of the modification request.
    property target_configuration : ReservedInstancesConfiguration | Nil

    def initialize(
      @reserved_instances_id : String | Nil = nil,
      @target_configuration : ReservedInstancesConfiguration | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reserved_instances_id
        params << {"#{prefix}ReservedInstancesId", value}
      end

      if value = @target_configuration
        params.concat(value.to_query_params("#{prefix}TargetConfiguration."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesId']")),
        target_configuration: node.xpath_node("*[local-name()='targetConfiguration']").try { |n| ReservedInstancesConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @target_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@reserved_instances_id, @target_configuration)
  end
end
