private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about items that were not successfully processed in a batch call.
  class UnsuccessfulItem
    # Information about the error.
    property error : UnsuccessfulItemError | Nil

    # The ID of the resource.
    property resource_id : String | Nil

    def initialize(
      @error : UnsuccessfulItemError | Nil = nil,
      @resource_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @error
        params.concat(value.to_query_params("#{prefix}Error."))
      end

      if value = @resource_id
        params << {"#{prefix}ResourceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        error: node.xpath_node("*[local-name()='error']").try { |n| UnsuccessfulItemError.from_xml(n) },
        resource_id: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceId']")),
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@error, @resource_id)
  end
end
