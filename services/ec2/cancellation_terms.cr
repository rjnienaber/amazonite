private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the cancellation terms for cancelling a future-dated Capacity Reservation during its
  # commitment duration.
  class CancellationTerms
    # The type of cancellation charge. Possible values include `commitment-wind-down`.
    property cancellation_type : ApplyCancellationCharges | Nil

    # The state that the Capacity Reservation will transition to after cancellation.
    property reservation_state : String | Nil

    # The number of instances under commitment after cancellation.
    property committed_instance_count : Int32 | Nil

    # The number of hours for which cancellation charges will apply.
    property charge_commitment_duration_hours : Int64 | Nil

    # The date and time at which cancellation charges will stop.
    property charge_end_date : Time | Nil

    def initialize(
      @cancellation_type : ApplyCancellationCharges | Nil = nil,
      @reservation_state : String | Nil = nil,
      @committed_instance_count : Int32 | Nil = nil,
      @charge_commitment_duration_hours : Int64 | Nil = nil,
      @charge_end_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cancellation_type
        params << {"#{prefix}CancellationType", value.to_json_object_key}
      end

      if value = @reservation_state
        params << {"#{prefix}ReservationState", value}
      end

      if value = @committed_instance_count
        params << {"#{prefix}CommittedInstanceCount", value.to_s}
      end

      if value = @charge_commitment_duration_hours
        params << {"#{prefix}ChargeCommitmentDurationHours", value.to_s}
      end

      if value = @charge_end_date
        params << {"#{prefix}ChargeEndDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cancellation_type: (n = node.xpath_node("*[local-name()='cancellationType']")) ? AEC::ApplyCancellationCharges.from_json_object_key?(n.content) : nil,
        reservation_state: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationState']")),
        committed_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='committedInstanceCount']")),
        charge_commitment_duration_hours: Core::XMLValue.i64(node.xpath_node("*[local-name()='chargeCommitmentDurationHours']")),
        charge_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='chargeEndDate']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cancellation_type, @reservation_state, @committed_instance_count, @charge_commitment_duration_hours, @charge_end_date)
  end
end
