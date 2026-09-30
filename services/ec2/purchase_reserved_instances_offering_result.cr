private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of PurchaseReservedInstancesOffering.
  class PurchaseReservedInstancesOfferingResult
    # The IDs of the purchased Reserved Instances. If your purchase crosses into a discounted pricing
    # tier, the final Reserved Instances IDs might change. For more information, see [Crossing pricing
    # tiers](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts-reserved-instances-application.html#crossing-pricing-tiers)
    # in the *Amazon EC2 User Guide*.
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
