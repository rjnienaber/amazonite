private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for DescribeScheduledInstanceAvailability.
  class DescribeScheduledInstanceAvailabilityRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The filters.
    #
    # - `availability-zone` - The Availability Zone (for example, `us-west-2a`).
    #
    # - `instance-type` - The instance type (for example, `c4.large`).
    #
    # - `platform` - The platform (`Linux/UNIX` or `Windows`).
    property filters : Array(Filter) | Nil

    # The time period for the first schedule to start.
    property first_slot_start_time_range : SlotDateTimeRangeRequest

    # The maximum number of results to return in a single call. This value can be between 5 and 300.
    # The default value is 300. To retrieve the remaining results, make another call with the returned
    # `NextToken` value.
    property max_results : Int32 | Nil

    # The maximum available duration, in hours. This value must be greater than
    # `MinSlotDurationInHours` and less than 1,720.
    property max_slot_duration_in_hours : Int32 | Nil

    # The minimum available duration, in hours. The minimum required duration is 1,200 hours per year.
    # For example, the minimum daily schedule is 4 hours, the minimum weekly schedule is 24 hours, and
    # the minimum monthly schedule is 100 hours.
    property min_slot_duration_in_hours : Int32 | Nil

    # The token for the next set of results.
    property next_token : String | Nil

    # The schedule recurrence.
    property recurrence : ScheduledInstanceRecurrenceRequest

    def initialize(
      @first_slot_start_time_range : SlotDateTimeRangeRequest,
      @recurrence : ScheduledInstanceRecurrenceRequest,
      @dry_run : Bool | Nil = nil,
      @filters : Array(Filter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @max_slot_duration_in_hours : Int32 | Nil = nil,
      @min_slot_duration_in_hours : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      (@filters || [] of Filter).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Filter.#{i}."))
      end

      params.concat(@first_slot_start_time_range.to_query_params("#{prefix}FirstSlotStartTimeRange."))

      if value = @max_results
        params << {"#{prefix}MaxResults", value.to_s}
      end

      if value = @max_slot_duration_in_hours
        params << {"#{prefix}MaxSlotDurationInHours", value.to_s}
      end

      if value = @min_slot_duration_in_hours
        params << {"#{prefix}MinSlotDurationInHours", value.to_s}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      params.concat(@recurrence.to_query_params("#{prefix}Recurrence."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        filters: node.xpath_nodes("*[local-name()='Filter']/*[local-name()='Filter']").map { |n| Filter.from_xml(n) },
        first_slot_start_time_range: node.xpath_node("*[local-name()='FirstSlotStartTimeRange']").try { |n| SlotDateTimeRangeRequest.from_xml(n) }.not_nil!,
        max_results: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxResults']")),
        max_slot_duration_in_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxSlotDurationInHours']")),
        min_slot_duration_in_hours: Core::XMLValue.i32(node.xpath_node("*[local-name()='MinSlotDurationInHours']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
        recurrence: node.xpath_node("*[local-name()='Recurrence']").try { |n| ScheduledInstanceRecurrenceRequest.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @filters
        value.each(&.validate!)
      end

      if value = @first_slot_start_time_range
        value.validate!
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 5") if value < 5
        raise Core::ValidationError.new("MaxResults value must be <= 300") if value > 300
      end

      if value = @recurrence
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @filters, @first_slot_start_time_range, @max_results, @max_slot_duration_in_hours, @min_slot_duration_in_hours, @next_token, @recurrence)
  end
end
