private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about how and when instances in an interruptible reservation can be
  # terminated when capacity is reclaimed.
  class InterruptionInfo
    # The ID of the source Capacity Reservation from which the interruptible reservation was created.
    property source_capacity_reservation_id : String | Nil

    # The interruption type that determines how instances are terminated when capacity is reclaimed.
    property interruption_type : InterruptionType | Nil

    def initialize(
      @source_capacity_reservation_id : String | Nil = nil,
      @interruption_type : InterruptionType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @source_capacity_reservation_id
        params << {"#{prefix}SourceCapacityReservationId", value}
      end

      if value = @interruption_type
        params << {"#{prefix}InterruptionType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        source_capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='sourceCapacityReservationId']")),
        interruption_type: (n = node.xpath_node("*[local-name()='interruptionType']")) ? AEC::InterruptionType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@source_capacity_reservation_id, @interruption_type)
  end
end
