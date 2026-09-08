private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The recommended Capacity Block extension that fits your search requirements.
  class CapacityBlockExtensionOffering
    # The ID of the Capacity Block extension offering.
    property capacity_block_extension_offering_id : String | Nil

    # The instance type of the Capacity Block that will be extended.
    property instance_type : String | Nil

    # The number of instances in the Capacity Block extension offering.
    property instance_count : Int32 | Nil

    # The Availability Zone of the Capacity Block that will be extended.
    property availability_zone : String | Nil

    # The Availability Zone ID of the Capacity Block that will be extended.
    property availability_zone_id : String | Nil

    # The start date of the Capacity Block that will be extended.
    property start_date : Time | Nil

    # The date and time at which the Capacity Block extension will start. This date is also the same
    # as the end date of the Capacity Block that will be extended.
    property capacity_block_extension_start_date : Time | Nil

    # The date and time at which the Capacity Block extension expires. When a Capacity Block expires,
    # the reserved capacity is released and you can no longer launch instances into it. The Capacity
    # Block's state changes to `expired` when it reaches its end date
    property capacity_block_extension_end_date : Time | Nil

    # The amount of time of the Capacity Block extension offering in hours.
    property capacity_block_extension_duration_hours : Int32 | Nil

    # The total price of the Capacity Block extension offering, to be paid up front.
    property upfront_fee : String | Nil

    # The currency of the payment for the Capacity Block extension offering.
    property currency_code : String | Nil

    # Indicates the tenancy of the Capacity Block extension offering. A Capacity Block can have one of
    # the following tenancy settings:
    #
    # - `default` - The Capacity Block is created on hardware that is shared with other Amazon Web
    # Services accounts.
    #
    # - `dedicated` - The Capacity Block is created on single-tenant hardware that is dedicated to a
    # single Amazon Web Services account.
    property tenancy : CapacityReservationTenancy | Nil

    # The type of zone where the Capacity Block extension offering is available.
    property zone_type : String | Nil

    def initialize(
      @capacity_block_extension_offering_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @start_date : Time | Nil = nil,
      @capacity_block_extension_start_date : Time | Nil = nil,
      @capacity_block_extension_end_date : Time | Nil = nil,
      @capacity_block_extension_duration_hours : Int32 | Nil = nil,
      @upfront_fee : String | Nil = nil,
      @currency_code : String | Nil = nil,
      @tenancy : CapacityReservationTenancy | Nil = nil,
      @zone_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_block_extension_offering_id
        params << {"#{prefix}CapacityBlockExtensionOfferingId", value}
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

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @capacity_block_extension_start_date
        params << {"#{prefix}CapacityBlockExtensionStartDate", Core::QueryValue.time(value)}
      end

      if value = @capacity_block_extension_end_date
        params << {"#{prefix}CapacityBlockExtensionEndDate", Core::QueryValue.time(value)}
      end

      if value = @capacity_block_extension_duration_hours
        params << {"#{prefix}CapacityBlockExtensionDurationHours", value.to_s}
      end

      if value = @upfront_fee
        params << {"#{prefix}UpfrontFee", value}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @zone_type
        params << {"#{prefix}ZoneType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_block_extension_offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockExtensionOfferingId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        capacity_block_extension_start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='capacityBlockExtensionStartDate']")),
        capacity_block_extension_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='capacityBlockExtensionEndDate']")),
        capacity_block_extension_duration_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='capacityBlockExtensionDurationHours']")),
        upfront_fee: Core::XMLValue.string(node.xpath_node("*[local-name()='upfrontFee']")),
        currency_code: Core::XMLValue.string(node.xpath_node("*[local-name()='currencyCode']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::CapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        zone_type: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_block_extension_offering_id, @instance_type, @instance_count, @availability_zone, @availability_zone_id, @start_date, @capacity_block_extension_start_date, @capacity_block_extension_end_date, @capacity_block_extension_duration_hours, @upfront_fee, @currency_code, @tenancy, @zone_type)
  end
end
