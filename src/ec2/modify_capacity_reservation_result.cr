private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyCapacityReservationResult
    # Returns `true` if the request succeeds; otherwise, it returns an error.
    property return : Bool | Nil

    # The status of the requested modification. For a description of each possible value, see the
    # `adjustmentStatus` field of the `CapacityReservation` data type.
    property adjustment_status : CapacityReservationAdjustmentStatus | Nil

    # The configuration that the Capacity Reservation will have after the adjustment is applied.
    property adjustment_details : CapacityReservationAdjustmentDetails | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @adjustment_status : CapacityReservationAdjustmentStatus | Nil = nil,
      @adjustment_details : CapacityReservationAdjustmentDetails | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      if value = @adjustment_status
        params << {"#{prefix}AdjustmentStatus", value.to_json_object_key}
      end

      if value = @adjustment_details
        params.concat(value.to_query_params("#{prefix}AdjustmentDetails."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        adjustment_status: (n = node.xpath_node("*[local-name()='adjustmentStatus']")) ? AEC::CapacityReservationAdjustmentStatus.from_json_object_key?(n.content) : nil,
        adjustment_details: node.xpath_node("*[local-name()='adjustmentDetails']").try { |n| CapacityReservationAdjustmentDetails.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @adjustment_details
        value.validate!
      end
    end

    def_equals_and_hash(@return, @adjustment_status, @adjustment_details)
  end
end
