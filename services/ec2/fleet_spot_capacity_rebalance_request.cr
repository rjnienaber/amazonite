private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The Spot Instance replacement strategy to use when Amazon EC2 emits a rebalance notification
  # signal that your Spot Instance is at an elevated risk of being interrupted. For more
  # information, see [Capacity
  # rebalancing](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-capacity-rebalance.html)
  # in the *Amazon EC2 User Guide*.
  class FleetSpotCapacityRebalanceRequest
    # The replacement strategy to use. Only available for fleets of type `maintain`.
    #
    # `launch` - EC2 Fleet launches a replacement Spot Instance when a rebalance notification is
    # emitted for an existing Spot Instance in the fleet. EC2 Fleet does not terminate the instances
    # that receive a rebalance notification. You can terminate the old instances, or you can leave
    # them running. You are charged for all instances while they are running.
    #
    # `launch-before-terminate` - EC2 Fleet launches a replacement Spot Instance when a rebalance
    # notification is emitted for an existing Spot Instance in the fleet, and then, after a delay that
    # you specify (in `TerminationDelay`), terminates the instances that received a rebalance
    # notification.
    property replacement_strategy : FleetReplacementStrategy | Nil

    # The amount of time (in seconds) that Amazon EC2 waits before terminating the old Spot Instance
    # after launching a new replacement Spot Instance.
    #
    # Required when `ReplacementStrategy` is set to `launch-before-terminate`.
    #
    # Not valid when `ReplacementStrategy` is set to `launch`.
    #
    # Valid values: Minimum value of `120` seconds. Maximum value of `7200` seconds.
    property termination_delay : Int32 | Nil

    def initialize(
      @replacement_strategy : FleetReplacementStrategy | Nil = nil,
      @termination_delay : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @replacement_strategy
        params << {"#{prefix}ReplacementStrategy", value.to_json_object_key}
      end

      if value = @termination_delay
        params << {"#{prefix}TerminationDelay", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        replacement_strategy: (n = node.xpath_node("*[local-name()='ReplacementStrategy']")) ? AEC::FleetReplacementStrategy.from_json_object_key?(n.content) : nil,
        termination_delay: Core::XMLValue.i32(node.xpath_node("*[local-name()='TerminationDelay']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@replacement_strategy, @termination_delay)
  end
end
