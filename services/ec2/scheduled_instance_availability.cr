private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a schedule that is available for your Scheduled Instances.
  class ScheduledInstanceAvailability
    # The Availability Zone.
    property availability_zone : String | Nil

    # The number of available instances.
    property available_instance_count : Int32 | Nil

    # The time period for the first schedule to start.
    property first_slot_start_time : Time | Nil

    # The hourly price for a single instance.
    property hourly_price : String | Nil

    # The instance type. You can specify one of the C3, C4, M4, or R3 instance types.
    property instance_type : String | Nil

    # The maximum term. The only possible value is 365 days.
    property max_term_duration_in_days : Int32 | Nil

    # The minimum term. The only possible value is 365 days.
    property min_term_duration_in_days : Int32 | Nil

    # The network platform.
    property network_platform : String | Nil

    # The platform (`Linux/UNIX` or `Windows`).
    property platform : String | Nil

    # The purchase token. This token expires in two hours.
    property purchase_token : String | Nil

    # The schedule recurrence.
    property recurrence : ScheduledInstanceRecurrence | Nil

    # The number of hours in the schedule.
    property slot_duration_in_hours : Int32 | Nil

    # The total number of hours for a single instance for the entire term.
    property total_scheduled_instance_hours : Int32 | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @available_instance_count : Int32 | Nil = nil,
      @first_slot_start_time : Time | Nil = nil,
      @hourly_price : String | Nil = nil,
      @instance_type : String | Nil = nil,
      @max_term_duration_in_days : Int32 | Nil = nil,
      @min_term_duration_in_days : Int32 | Nil = nil,
      @network_platform : String | Nil = nil,
      @platform : String | Nil = nil,
      @purchase_token : String | Nil = nil,
      @recurrence : ScheduledInstanceRecurrence | Nil = nil,
      @slot_duration_in_hours : Int32 | Nil = nil,
      @total_scheduled_instance_hours : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @available_instance_count
        params << {"#{prefix}AvailableInstanceCount", value.to_s}
      end

      if value = @first_slot_start_time
        params << {"#{prefix}FirstSlotStartTime", Core::QueryValue.time(value)}
      end

      if value = @hourly_price
        params << {"#{prefix}HourlyPrice", value}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @max_term_duration_in_days
        params << {"#{prefix}MaxTermDurationInDays", value.to_s}
      end

      if value = @min_term_duration_in_days
        params << {"#{prefix}MinTermDurationInDays", value.to_s}
      end

      if value = @network_platform
        params << {"#{prefix}NetworkPlatform", value}
      end

      if value = @platform
        params << {"#{prefix}Platform", value}
      end

      if value = @purchase_token
        params << {"#{prefix}PurchaseToken", value}
      end

      if value = @recurrence
        params.concat(value.to_query_params("#{prefix}Recurrence."))
      end

      if value = @slot_duration_in_hours
        params << {"#{prefix}SlotDurationInHours", value.to_s}
      end

      if value = @total_scheduled_instance_hours
        params << {"#{prefix}TotalScheduledInstanceHours", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        available_instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='availableInstanceCount']")),
        first_slot_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='firstSlotStartTime']")),
        hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='hourlyPrice']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        max_term_duration_in_days: Core::XMLValue.i32(node.xpath_node("*[local-name()='maxTermDurationInDays']")),
        min_term_duration_in_days: Core::XMLValue.i32(node.xpath_node("*[local-name()='minTermDurationInDays']")),
        network_platform: Core::XMLValue.string(node.xpath_node("*[local-name()='networkPlatform']")),
        platform: Core::XMLValue.string(node.xpath_node("*[local-name()='platform']")),
        purchase_token: Core::XMLValue.string(node.xpath_node("*[local-name()='purchaseToken']")),
        recurrence: node.xpath_node("*[local-name()='recurrence']").try { |n| ScheduledInstanceRecurrence.from_xml(n) },
        slot_duration_in_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='slotDurationInHours']")),
        total_scheduled_instance_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalScheduledInstanceHours']")),
      )
    end

    def validate! : Nil
      if value = @recurrence
        value.validate!
      end
    end

    def_equals_and_hash(@availability_zone, @available_instance_count, @first_slot_start_time, @hourly_price, @instance_type, @max_term_duration_in_days, @min_term_duration_in_days, @network_platform, @platform, @purchase_token, @recurrence, @slot_duration_in_hours, @total_scheduled_instance_hours)
  end
end
