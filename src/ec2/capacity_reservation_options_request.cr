private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the strategy for using unused Capacity Reservations for fulfilling On-Demand capacity.
  #
  # This strategy can only be used if the EC2 Fleet is of type `instant`.
  #
  # For more information about Capacity Reservations, see [On-Demand Capacity
  # Reservations](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html)
  # in the *Amazon EC2 User Guide*. For examples of using Capacity Reservations in an EC2 Fleet, see
  # [EC2 Fleet example
  # configurations](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-examples.html) in
  # the *Amazon EC2 User Guide*.
  class CapacityReservationOptionsRequest
    # Indicates whether to use unused Capacity Reservations for fulfilling On-Demand capacity.
    #
    # If you specify `use-capacity-reservations-first`, the fleet uses unused Capacity Reservations to
    # fulfill On-Demand capacity up to the target On-Demand capacity. If multiple instance pools have
    # unused Capacity Reservations, the On-Demand allocation strategy (`lowest-price` or
    # `prioritized`) is applied. If the number of unused Capacity Reservations is less than the
    # On-Demand target capacity, the remaining On-Demand target capacity is launched according to the
    # On-Demand allocation strategy (`lowest-price` or `prioritized`).
    #
    # If you do not specify a value, the fleet fulfils the On-Demand capacity according to the chosen
    # On-Demand allocation strategy.
    property usage_strategy : FleetCapacityReservationUsageStrategy | Nil

    def initialize(
      @usage_strategy : FleetCapacityReservationUsageStrategy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @usage_strategy
        params << {"#{prefix}UsageStrategy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        usage_strategy: (n = node.xpath_node("*[local-name()='UsageStrategy']")) ? AEC::FleetCapacityReservationUsageStrategy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@usage_strategy)
  end
end
