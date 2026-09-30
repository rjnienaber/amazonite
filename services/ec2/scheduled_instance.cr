private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Scheduled Instance.
  class ScheduledInstance
    # The Availability Zone.
    property availability_zone : String | Nil

    # The date when the Scheduled Instance was purchased.
    property create_date : Time | Nil

    # The hourly price for a single instance.
    property hourly_price : String | Nil

    # The number of instances.
    property instance_count : Int32 | Nil

    # The instance type.
    property instance_type : String | Nil

    # The network platform.
    property network_platform : String | Nil

    # The time for the next schedule to start.
    property next_slot_start_time : Time | Nil

    # The platform (`Linux/UNIX` or `Windows`).
    property platform : String | Nil

    # The time that the previous schedule ended or will end.
    property previous_slot_end_time : Time | Nil

    # The schedule recurrence.
    property recurrence : ScheduledInstanceRecurrence | Nil

    # The Scheduled Instance ID.
    property scheduled_instance_id : String | Nil

    # The number of hours in the schedule.
    property slot_duration_in_hours : Int32 | Nil

    # The end date for the Scheduled Instance.
    property term_end_date : Time | Nil

    # The start date for the Scheduled Instance.
    property term_start_date : Time | Nil

    # The total number of hours for a single instance for the entire term.
    property total_scheduled_instance_hours : Int32 | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @hourly_price : String | Nil = nil,
      @instance_count : Int32 | Nil = nil,
      @instance_type : String | Nil = nil,
      @network_platform : String | Nil = nil,
      @next_slot_start_time : Time | Nil = nil,
      @platform : String | Nil = nil,
      @previous_slot_end_time : Time | Nil = nil,
      @recurrence : ScheduledInstanceRecurrence | Nil = nil,
      @scheduled_instance_id : String | Nil = nil,
      @slot_duration_in_hours : Int32 | Nil = nil,
      @term_end_date : Time | Nil = nil,
      @term_start_date : Time | Nil = nil,
      @total_scheduled_instance_hours : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @hourly_price
        params << {"#{prefix}HourlyPrice", value}
      end

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @instance_type
        params << {"#{prefix}InstanceType", value}
      end

      if value = @network_platform
        params << {"#{prefix}NetworkPlatform", value}
      end

      if value = @next_slot_start_time
        params << {"#{prefix}NextSlotStartTime", Core::QueryValue.time(value)}
      end

      if value = @platform
        params << {"#{prefix}Platform", value}
      end

      if value = @previous_slot_end_time
        params << {"#{prefix}PreviousSlotEndTime", Core::QueryValue.time(value)}
      end

      if value = @recurrence
        params.concat(value.to_query_params("#{prefix}Recurrence."))
      end

      if value = @scheduled_instance_id
        params << {"#{prefix}ScheduledInstanceId", value}
      end

      if value = @slot_duration_in_hours
        params << {"#{prefix}SlotDurationInHours", value.to_s}
      end

      if value = @term_end_date
        params << {"#{prefix}TermEndDate", Core::QueryValue.time(value)}
      end

      if value = @term_start_date
        params << {"#{prefix}TermStartDate", Core::QueryValue.time(value)}
      end

      if value = @total_scheduled_instance_hours
        params << {"#{prefix}TotalScheduledInstanceHours", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='createDate']")),
        hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='hourlyPrice']")),
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        instance_type: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceType']")),
        network_platform: Core::XMLValue.string(node.xpath_node("*[local-name()='networkPlatform']")),
        next_slot_start_time: Core::XMLValue.time(node.xpath_node("*[local-name()='nextSlotStartTime']")),
        platform: Core::XMLValue.string(node.xpath_node("*[local-name()='platform']")),
        previous_slot_end_time: Core::XMLValue.time(node.xpath_node("*[local-name()='previousSlotEndTime']")),
        recurrence: node.xpath_node("*[local-name()='recurrence']").try { |n| ScheduledInstanceRecurrence.from_xml(n) },
        scheduled_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='scheduledInstanceId']")),
        slot_duration_in_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='slotDurationInHours']")),
        term_end_date: Core::XMLValue.time(node.xpath_node("*[local-name()='termEndDate']")),
        term_start_date: Core::XMLValue.time(node.xpath_node("*[local-name()='termStartDate']")),
        total_scheduled_instance_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalScheduledInstanceHours']")),
      )
    end

    def validate! : Nil
      if value = @recurrence
        value.validate!
      end
    end

    def_equals_and_hash(@availability_zone, @create_date, @hourly_price, @instance_count, @instance_type, @network_platform, @next_slot_start_time, @platform, @previous_slot_end_time, @recurrence, @scheduled_instance_id, @slot_duration_in_hours, @term_end_date, @term_start_date, @total_scheduled_instance_hours)
  end
end
