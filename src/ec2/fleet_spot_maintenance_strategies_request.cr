private alias Core = Amazonite::Core

module Amazonite::EC2
  # The strategies for managing your Spot Instances that are at an elevated risk of being
  # interrupted.
  class FleetSpotMaintenanceStrategiesRequest
    # The strategy to use when Amazon EC2 emits a signal that your Spot Instance is at an elevated
    # risk of being interrupted.
    property capacity_rebalance : FleetSpotCapacityRebalanceRequest | Nil

    def initialize(
      @capacity_rebalance : FleetSpotCapacityRebalanceRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_rebalance
        params.concat(value.to_query_params("#{prefix}CapacityRebalance."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_rebalance: node.xpath_node("*[local-name()='CapacityRebalance']").try { |n| FleetSpotCapacityRebalanceRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_rebalance
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_rebalance)
  end
end
