private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about your commitment for a future-dated Capacity Reservation.
  class CapacityReservationCommitmentInfo
    # The instance capacity that you committed to when you requested the future-dated Capacity
    # Reservation.
    property committed_instance_count : Int32 | Nil

    # The date and time at which the commitment duration expires, in the ISO8601 format in the UTC
    # time zone (`YYYY-MM-DDThh:mm:ss.sssZ`). You can't decrease the instance count or cancel the
    # Capacity Reservation before this date and time.
    property commitment_end_date : Time | Nil

    def initialize(
      @committed_instance_count : Int32 | Nil = nil,
      @commitment_end_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @committed_instance_count
        params << {"#{prefix}CommittedInstanceCount", value.to_s}
      end

      if value = @commitment_end_date
        params << {"#{prefix}CommitmentEndDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        committed_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='committedInstanceCount']")),
        commitment_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='commitmentEndDate']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@committed_instance_count, @commitment_end_date)
  end
end
