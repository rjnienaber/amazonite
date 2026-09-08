private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of ModifyReservedInstances.
  class ModifyReservedInstancesResult
    # The ID for the modification.
    property reserved_instances_modification_id : String | Nil

    def initialize(
      @reserved_instances_modification_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reserved_instances_modification_id
        params << {"#{prefix}ReservedInstancesModificationId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_modification_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesModificationId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@reserved_instances_modification_id)
  end
end
