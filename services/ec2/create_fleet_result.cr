private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateFleetResult
    # The ID of the EC2 Fleet.
    property fleet_id : String | Nil

    # Information about the instances that could not be launched by the fleet. Supported only for
    # fleets of type `instant`.
    property errors : Array(CreateFleetError) | Nil

    # Information about the instances that were launched by the fleet. Supported only for fleets of
    # type `instant`.
    property instances : Array(CreateFleetInstance) | Nil

    def initialize(
      @fleet_id : String | Nil = nil,
      @errors : Array(CreateFleetError) | Nil = nil,
      @instances : Array(CreateFleetInstance) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @fleet_id
        params << {"#{prefix}FleetId", value}
      end

      (@errors || [] of CreateFleetError).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ErrorSet.#{i}."))
      end

      (@instances || [] of CreateFleetInstance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}FleetInstanceSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fleetId']")),
        errors: node.xpath_nodes("*[local-name()='errorSet']/*[local-name()='item']").map { |n| CreateFleetError.from_xml(n) },
        instances: node.xpath_nodes("*[local-name()='fleetInstanceSet']/*[local-name()='item']").map { |n| CreateFleetInstance.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @errors
        value.each(&.validate!)
      end

      if value = @instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@fleet_id, @errors, @instances)
  end
end
