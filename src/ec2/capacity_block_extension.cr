private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Capacity Block extension. With an extension, you can extend the duration of time for
  # an existing Capacity Block.
  class CapacityBlockExtension
    # The reservation ID of the Capacity Block extension.
    property capacity_reservation_id : String | Nil

    # The instance type of the Capacity Block extension.
    property instance_type : String | Nil

    # The number of instances in the Capacity Block extension.
    property instance_count : Int32 | Nil

    # The Availability Zone of the Capacity Block extension.
    property availability_zone : String | Nil

    # The Availability Zone ID of the Capacity Block extension.
    property availability_zone_id : String | Nil

    # The ID of the Capacity Block extension offering.
    property capacity_block_extension_offering_id : String | Nil

    # The duration of the Capacity Block extension in hours.
    property capacity_block_extension_duration_hours : Int32 | Nil

    # The status of the Capacity Block extension. A Capacity Block extension can have one of the
    # following statuses:
    #
    # - `payment-pending` - The Capacity Block extension payment is processing. If your payment can't
    # be processed within 12 hours, the Capacity Block extension is failed.
    #
    # - `payment-failed` - Payment for the Capacity Block extension request was not successful.
    #
    # - `payment-succeeded` - Payment for the Capacity Block extension request was successful. You
    # receive an invoice that reflects the one-time upfront payment. In the invoice, you can associate
    # the paid amount with the Capacity Block reservation ID.
    property capacity_block_extension_status : CapacityBlockExtensionStatus | Nil

    # The date when the Capacity Block extension was purchased.
    property capacity_block_extension_purchase_date : Time | Nil

    # The start date of the Capacity Block extension.
    property capacity_block_extension_start_date : Time | Nil

    # The end date of the Capacity Block extension.
    property capacity_block_extension_end_date : Time | Nil

    # The total price to be paid up front.
    property upfront_fee : String | Nil

    # The currency of the payment for the Capacity Block extension.
    property currency_code : String | Nil

    # The type of zone where the Capacity Block extension is located.
    property zone_type : String | Nil

    def initialize(
      @capacity_reservation_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @capacity_block_extension_offering_id : String | Nil = nil,
      @capacity_block_extension_duration_hours : Int32 | Nil = nil,
      @capacity_block_extension_status : CapacityBlockExtensionStatus | Nil = nil,
      @capacity_block_extension_purchase_date : Time | Nil = nil,
      @capacity_block_extension_start_date : Time | Nil = nil,
      @capacity_block_extension_end_date : Time | Nil = nil,
      @upfront_fee : String | Nil = nil,
      @currency_code : String | Nil = nil,
      @zone_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @capacity_block_extension_offering_id
        params << {"#{prefix}CapacityBlockExtensionOfferingId", value}
      end

      if value = @capacity_block_extension_duration_hours
        params << {"#{prefix}CapacityBlockExtensionDurationHours", value.to_s}
      end

      if value = @capacity_block_extension_status
        params << {"#{prefix}CapacityBlockExtensionStatus", value.to_json_object_key}
      end

      if value = @capacity_block_extension_purchase_date
        params << {"#{prefix}CapacityBlockExtensionPurchaseDate", Core::QueryValue.time(value)}
      end

      if value = @capacity_block_extension_start_date
        params << {"#{prefix}CapacityBlockExtensionStartDate", Core::QueryValue.time(value)}
      end

      if value = @capacity_block_extension_end_date
        params << {"#{prefix}CapacityBlockExtensionEndDate", Core::QueryValue.time(value)}
      end

      if value = @upfront_fee
        params << {"#{prefix}UpfrontFee", value}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value}
      end

      if value = @zone_type
        params << {"#{prefix}ZoneType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        capacity_block_extension_offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockExtensionOfferingId']")),
        capacity_block_extension_duration_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='capacityBlockExtensionDurationHours']")),
        capacity_block_extension_status: (n = node.xpath_node("*[local-name()='capacityBlockExtensionStatus']")) ? AEC::CapacityBlockExtensionStatus.from_json_object_key?(n.content) : nil,
        capacity_block_extension_purchase_date: Core::XMLValue.time(node.xpath_node("*[local-name()='capacityBlockExtensionPurchaseDate']")),
        capacity_block_extension_start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='capacityBlockExtensionStartDate']")),
        capacity_block_extension_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='capacityBlockExtensionEndDate']")),
        upfront_fee: Core::XMLValue.string(node.xpath_node("*[local-name()='upfrontFee']")),
        currency_code: Core::XMLValue.string(node.xpath_node("*[local-name()='currencyCode']")),
        zone_type: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_id, @instance_type, @instance_count, @availability_zone, @availability_zone_id, @capacity_block_extension_offering_id, @capacity_block_extension_duration_hours, @capacity_block_extension_status, @capacity_block_extension_purchase_date, @capacity_block_extension_start_date, @capacity_block_extension_end_date, @upfront_fee, @currency_code, @zone_type)
  end
end
