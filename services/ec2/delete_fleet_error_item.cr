private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an EC2 Fleet that was not successfully deleted.
  class DeleteFleetErrorItem
    # The error.
    property error : DeleteFleetError | Nil

    # The ID of the EC2 Fleet.
    property fleet_id : String | Nil

    def initialize(
      @error : DeleteFleetError | Nil = nil,
      @fleet_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @error
        params.concat(value.to_query_params("#{prefix}Error."))
      end

      if value = @fleet_id
        params << {"#{prefix}FleetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        error: node.xpath_node("*[local-name()='error']").try { |n| DeleteFleetError.from_xml(n) },
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fleetId']")),
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@error, @fleet_id)
  end
end
