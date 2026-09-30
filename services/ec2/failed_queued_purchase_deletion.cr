private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance whose queued purchase was not deleted.
  class FailedQueuedPurchaseDeletion
    # The error.
    property error : DeleteQueuedReservedInstancesError | Nil

    # The ID of the Reserved Instance.
    property reserved_instances_id : String | Nil

    def initialize(
      @error : DeleteQueuedReservedInstancesError | Nil = nil,
      @reserved_instances_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @error
        params.concat(value.to_query_params("#{prefix}Error."))
      end

      if value = @reserved_instances_id
        params << {"#{prefix}ReservedInstancesId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        error: node.xpath_node("*[local-name()='error']").try { |n| DeleteQueuedReservedInstancesError.from_xml(n) },
        reserved_instances_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstancesId']")),
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@error, @reserved_instances_id)
  end
end
