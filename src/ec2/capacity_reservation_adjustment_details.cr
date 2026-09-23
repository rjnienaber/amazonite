private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration that a Capacity Reservation will have after a pending adjustment is
  # applied.
  class CapacityReservationAdjustmentDetails
    # The start date that the Capacity Reservation will have after the adjustment.
    property start_date : Time | Nil

    # The end date that the Capacity Reservation will have after the adjustment.
    property end_date : Time | Nil

    # The date and time at which the commitment duration will expire after the adjustment.
    property commitment_end_date : Time | Nil

    # Indicates the way in which the Capacity Reservation will end after the adjustment. Possible
    # values are:
    #
    # - `unlimited` - The Capacity Reservation remains active until you explicitly cancel it.
    #
    # - `limited` - The Capacity Reservation expires automatically at the date and time given by
    # `endDate`.
    property end_date_type : String | Nil

    # The commitment duration, in seconds, that the Capacity Reservation will have after the
    # adjustment.
    property commitment_duration : Int64 | Nil

    def initialize(
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @commitment_end_date : Time | Nil = nil,
      @end_date_type : String | Nil = nil,
      @commitment_duration : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @commitment_end_date
        params << {"#{prefix}CommitmentEndDate", Core::QueryValue.time(value)}
      end

      if value = @end_date_type
        params << {"#{prefix}EndDateType", value}
      end

      if value = @commitment_duration
        params << {"#{prefix}CommitmentDuration", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        commitment_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='commitmentEndDate']")),
        end_date_type: Core::XMLValue.string(node.xpath_node("*[local-name()='endDateType']")),
        commitment_duration: Core::XMLValue.i64(node.xpath_node("*[local-name()='commitmentDuration']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@start_date, @end_date, @commitment_end_date, @end_date_type, @commitment_duration)
  end
end
