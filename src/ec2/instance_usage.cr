private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the Capacity Reservation usage.
  class InstanceUsage
    # The ID of the Amazon Web Services account that is making use of the Capacity Reservation.
    property account_id : String | Nil

    # The number of instances the Amazon Web Services account currently has in the Capacity
    # Reservation.
    property used_instance_count : Int32 | Nil

    def initialize(
      @account_id : String | Nil = nil,
      @used_instance_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @account_id
        params << {"#{prefix}AccountId", value}
      end

      if value = @used_instance_count
        params << {"#{prefix}UsedInstanceCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='accountId']")),
        used_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='usedInstanceCount']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@account_id, @used_instance_count)
  end
end
