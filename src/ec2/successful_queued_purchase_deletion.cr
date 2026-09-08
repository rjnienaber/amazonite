private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance whose queued purchase was successfully deleted.
  class SuccessfulQueuedPurchaseDeletion
    # The ID of the Reserved Instance.
    property reserved_instances_id : String | Nil

    def initialize(
      @reserved_instances_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reserved_instances_id
        params << {"#{prefix}ReservedInstancesId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reserved_instances_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@reserved_instances_id)
  end
end
