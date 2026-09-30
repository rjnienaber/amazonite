private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about a request to assign billing of the unused capacity of a Capacity Reservation.
  class CapacityReservationBillingRequest
    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # The ID of the Amazon Web Services account that initiated the request.
    property requested_by : String | Nil

    # The ID of the Amazon Web Services account to which the request was sent.
    property unused_reservation_billing_owner_id : String | Nil

    # The date and time, in UTC time format, at which the request was initiated.
    property last_update_time : Time | Nil

    # The status of the request. For more information, see [ View billing assignment requests for a
    # shared Amazon EC2 Capacity
    # Reservation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/view-billing-transfers.html).
    property status : CapacityReservationBillingRequestStatus | Nil

    # Information about the status.
    property status_message : String | Nil

    # Information about the Capacity Reservation.
    property capacity_reservation_info : CapacityReservationInfo | Nil

    def initialize(
      @capacity_reservation_id : String | Nil = nil,
      @requested_by : String | Nil = nil,
      @unused_reservation_billing_owner_id : String | Nil = nil,
      @last_update_time : Time | Nil = nil,
      @status : CapacityReservationBillingRequestStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @capacity_reservation_info : CapacityReservationInfo | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @requested_by
        params << {"#{prefix}RequestedBy", value}
      end

      if value = @unused_reservation_billing_owner_id
        params << {"#{prefix}UnusedReservationBillingOwnerId", value}
      end

      if value = @last_update_time
        params << {"#{prefix}LastUpdateTime", Core::QueryValue.time(value)}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @capacity_reservation_info
        params.concat(value.to_query_params("#{prefix}CapacityReservationInfo."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        requested_by: Core::XMLValue.string(node.xpath_node("*[local-name()='requestedBy']")),
        unused_reservation_billing_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='unusedReservationBillingOwnerId']")),
        last_update_time: Core::XMLValue.time(node.xpath_node("*[local-name()='lastUpdateTime']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::CapacityReservationBillingRequestStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='statusMessage']")),
        capacity_reservation_info: node.xpath_node("*[local-name()='capacityReservationInfo']").try { |n| CapacityReservationInfo.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @unused_reservation_billing_owner_id
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("UnusedReservationBillingOwnerId does not match the required pattern") unless value.matches?(Regex.new("^[0-9]{12}$"))
      end

      if value = @capacity_reservation_info
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_reservation_id, @requested_by, @unused_reservation_billing_owner_id, @last_update_time, @status, @status_message, @capacity_reservation_info)
  end
end
