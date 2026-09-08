private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateInstanceEventWindowRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The name of the event window.
    property name : String | Nil

    # The time range for the event window. If you specify a time range, you can't specify a cron
    # expression.
    property time_ranges : Array(InstanceEventWindowTimeRangeRequest) | Nil

    # The cron expression for the event window, for example, `* 0-4,20-23 * * 1,5`. If you specify a
    # cron expression, you can't specify a time range.
    #
    # Constraints:
    #
    # - Only hour and day of the week values are supported.
    #
    # - For day of the week values, you can specify either integers `0` through `6`, or alternative
    # single values `SUN` through `SAT`.
    #
    # - The minute, month, and year must be specified by `*`.
    #
    # - The hour value must be one or a multiple range, for example, `0-4` or `0-4,20-23`.
    #
    # - Each hour range must be >= 2 hours, for example, `0-2` or `20-23`.
    #
    # - The event window must be >= 4 hours. The combined total time ranges in the event window must
    # be >= 4 hours.
    #
    # For more information about cron expressions, see [cron](https://en.wikipedia.org/wiki/Cron) on
    # the *Wikipedia website*.
    property cron_expression : String | Nil

    # The tags to apply to the event window.
    property tag_specifications : Array(TagSpecification) | Nil

    def initialize(
      @dry_run : Bool | Nil = nil,
      @name : String | Nil = nil,
      @time_ranges : Array(InstanceEventWindowTimeRangeRequest) | Nil = nil,
      @cron_expression : String | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      (@time_ranges || [] of InstanceEventWindowTimeRangeRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TimeRange.#{i}."))
      end

      if value = @cron_expression
        params << {"#{prefix}CronExpression", value}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        time_ranges: node.xpath_nodes("*[local-name()='TimeRange']/*[local-name()='item']").map { |n| InstanceEventWindowTimeRangeRequest.from_xml(n) },
        cron_expression: Core::XMLValue.string(node.xpath_node("*[local-name()='CronExpression']")),
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @time_ranges
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @name, @time_ranges, @cron_expression, @tag_specifications)
  end
end
