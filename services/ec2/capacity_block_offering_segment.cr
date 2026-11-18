private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an individual segment within a Capacity Block offering. Each segment represents a
  # distinct block of capacity with its own Availability Zone, instance type, duration, pricing, and
  # schedule.
  class CapacityBlockOfferingSegment
    # The instance type of the Capacity Block offering segment.
    property instance_type : String | Nil

    # The Availability Zone of the Capacity Block offering segment.
    property availability_zone : String | Nil

    # The ID of the Availability Zone for the Capacity Block offering segment.
    property availability_zone_id : String | Nil

    # The number of instances in the Capacity Block offering segment.
    property instance_count : Int32 | Nil

    # The start date of the Capacity Block offering segment.
    property start_date : Time | Nil

    # The end date of the Capacity Block offering segment.
    property end_date : Time | Nil

    # The number of hours for the duration of the Capacity Block offering segment.
    property capacity_block_duration_hours : Int32 | Nil

    # The number of minutes for the duration of the Capacity Block offering segment.
    property capacity_block_duration_minutes : Int32 | Nil

    # The total price to be paid up front for the Capacity Block offering segment.
    property upfront_fee : String | Nil

    # The currency of the payment for the Capacity Block offering segment.
    property currency_code : String | Nil

    # The type of zone where the Capacity Block offering segment is available.
    property zone_type : String | Nil

    def initialize(
      @instance_type : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @capacity_block_duration_hours : Int32 | Nil = nil,
      @capacity_block_duration_minutes : Int32 | Nil = nil,
      @upfront_fee : String | Nil = nil,
      @currency_code : String | Nil = nil,
      @zone_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @start_date
        params << {"#{prefix}StartDate", Core::QueryValue.time(value)}
      end

      if value = @end_date
        params << {"#{prefix}EndDate", Core::QueryValue.time(value)}
      end

      if value = @capacity_block_duration_hours
        params << {"#{prefix}CapacityBlockDurationHours", value.to_s}
      end

      if value = @capacity_block_duration_minutes
        params << {"#{prefix}CapacityBlockDurationMinutes", value.to_s}
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
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        capacity_block_duration_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='capacityBlockDurationHours']")),
        capacity_block_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='capacityBlockDurationMinutes']")),
        upfront_fee: Core::XMLValue.string(node.xpath_node("*[local-name()='upfrontFee']")),
        currency_code: Core::XMLValue.string(node.xpath_node("*[local-name()='currencyCode']")),
        zone_type: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_type, @availability_zone, @availability_zone_id, @instance_count, @start_date, @end_date, @capacity_block_duration_hours, @capacity_block_duration_minutes, @upfront_fee, @currency_code, @zone_type)
  end
end
