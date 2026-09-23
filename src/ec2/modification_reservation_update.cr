private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the changes that a Capacity Reservation modification quote will apply to a Capacity
  # Reservation.
  class ModificationReservationUpdate
    # The date and time at which the commitment duration will expire after the modification, in the
    # ISO8601 format in the UTC time zone (`YYYY-MM-DDThh:mm:ss.sssZ`).
    property new_commitment_end_date : Time | Nil

    # The start date that the Capacity Reservation will have after the modification, in the ISO8601
    # format in the UTC time zone (`YYYY-MM-DDThh:mm:ss.sssZ`).
    property new_start_date : Time | Nil

    # The commitment duration, in seconds, that the Capacity Reservation will have after the
    # modification.
    property new_commitment_duration : Int32 | Nil

    def initialize(
      @new_commitment_end_date : Time | Nil = nil,
      @new_start_date : Time | Nil = nil,
      @new_commitment_duration : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @new_commitment_end_date
        params << {"#{prefix}NewCommitmentEndDate", Core::QueryValue.time(value)}
      end

      if value = @new_start_date
        params << {"#{prefix}NewStartDate", Core::QueryValue.time(value)}
      end

      if value = @new_commitment_duration
        params << {"#{prefix}NewCommitmentDuration", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        new_commitment_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='newCommitmentEndDate']")),
        new_start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='newStartDate']")),
        new_commitment_duration: Core::XMLValue.i32(node.xpath_node("*[local-name()='newCommitmentDuration']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@new_commitment_end_date, @new_start_date, @new_commitment_duration)
  end
end
