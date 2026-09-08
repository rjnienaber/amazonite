private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeFleetInstancesResult
    # The running instances. This list is refreshed periodically and might be out of date.
    property active_instances : Array(ActiveInstance) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    # The ID of the EC2 Fleet.
    property fleet_id : String | Nil

    def initialize(
      @active_instances : Array(ActiveInstance) | Nil = nil,
      @next_token : String | Nil = nil,
      @fleet_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@active_instances || [] of ActiveInstance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ActiveInstanceSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      if value = @fleet_id
        params << {"#{prefix}FleetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        active_instances: node.xpath_nodes("*[local-name()='activeInstanceSet']/*[local-name()='item']").map { |n| ActiveInstance.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fleetId']")),
      )
    end

    def validate! : Nil
      if value = @active_instances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@active_instances, @next_token, @fleet_id)
  end
end
