private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The recommended Capacity Block that fits your search requirements.
  class CapacityBlockOffering
    # The ID of the Capacity Block offering.
    property capacity_block_offering_id : String | Nil

    # The instance type of the Capacity Block offering.
    property instance_type : String | Nil

    # The Availability Zone of the Capacity Block offering.
    property availability_zone : String | Nil

    # The number of instances in the Capacity Block offering.
    property instance_count : Int32 | Nil

    # The start date of the Capacity Block offering.
    property start_date : Time | Nil

    # The end date of the Capacity Block offering.
    property end_date : Time | Nil

    # The number of hours (in addition to `capacityBlockDurationMinutes`) for the duration of the
    # Capacity Block reservation. For example, if a Capacity Block starts at **04:55** and ends at
    # **11:30**, the hours field would be **6**.
    property capacity_block_duration_hours : Int32 | Nil

    # The total price to be paid up front.
    property upfront_fee : String | Nil

    # The currency of the payment for the Capacity Block.
    property currency_code : String | Nil

    # The tenancy of the Capacity Block.
    property tenancy : CapacityReservationTenancy | Nil

    # The EC2 UltraServer type of the Capacity Block offering.
    property ultraserver_type : String | Nil

    # The number of EC2 UltraServers in the offering.
    property ultraserver_count : Int32 | Nil

    # The number of minutes (in addition to `capacityBlockDurationHours`) for the duration of the
    # Capacity Block reservation. For example, if a Capacity Block starts at **08:55** and ends at
    # **11:30**, the minutes field would be **35**.
    property capacity_block_duration_minutes : Int32 | Nil

    # The type of zone where the Capacity Block offering is available.
    property zone_type : String | Nil

    def initialize(
      @capacity_block_offering_id : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @availability_zone : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @start_date : Time | Nil = nil,
      @end_date : Time | Nil = nil,
      @capacity_block_duration_hours : Int32 | Nil = nil,
      @upfront_fee : String | Nil = nil,
      @currency_code : String | Nil = nil,
      @tenancy : CapacityReservationTenancy | Nil = nil,
      @ultraserver_type : String | Nil = nil,
      @ultraserver_count : Int32 | Nil = nil,
      @capacity_block_duration_minutes : Int32 | Nil = nil,
      @zone_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_block_offering_id
        params << {"#{prefix}CapacityBlockOfferingId", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
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

      if value = @upfront_fee
        params << {"#{prefix}UpfrontFee", value}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value}
      end

      if value = @tenancy
        params << {"#{prefix}Tenancy", value.to_json_object_key}
      end

      if value = @ultraserver_type
        params << {"#{prefix}UltraserverType", value}
      end

      if value = @ultraserver_count
        params << {"#{prefix}UltraserverCount", value.to_s}
      end

      if value = @capacity_block_duration_minutes
        params << {"#{prefix}CapacityBlockDurationMinutes", value.to_s}
      end

      if value = @zone_type
        params << {"#{prefix}ZoneType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_block_offering_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityBlockOfferingId']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='startDate']")),
        end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='endDate']")),
        capacity_block_duration_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='capacityBlockDurationHours']")),
        upfront_fee: Core::XMLValue.string(node.xpath_node("*[local-name()='upfrontFee']")),
        currency_code: Core::XMLValue.string(node.xpath_node("*[local-name()='currencyCode']")),
        tenancy: (n = node.xpath_node("*[local-name()='tenancy']")) ? AEC::CapacityReservationTenancy.from_json_object_key?(n.content) : nil,
        ultraserver_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ultraserverType']")),
        ultraserver_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ultraserverCount']")),
        capacity_block_duration_minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='capacityBlockDurationMinutes']")),
        zone_type: Core::XMLValue.string(node.xpath_node("*[local-name()='zoneType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_block_offering_id, @instance_type, @availability_zone, @instance_count, @start_date, @end_date, @capacity_block_duration_hours, @upfront_fee, @currency_code, @tenancy, @ultraserver_type, @ultraserver_count, @capacity_block_duration_minutes, @zone_type)
  end
end
