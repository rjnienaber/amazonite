private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The event window.
  class InstanceEventWindow
    # The ID of the event window.
    property instance_event_window_id : String | Nil

    # One or more time ranges defined for the event window.
    property time_ranges : Array(InstanceEventWindowTimeRange) | Nil

    # The name of the event window.
    property name : String | Nil

    # The cron expression defined for the event window.
    property cron_expression : String | Nil

    # One or more targets associated with the event window.
    property association_target : InstanceEventWindowAssociationTarget | Nil

    # The current state of the event window.
    property state : InstanceEventWindowState | Nil

    # The instance tags associated with the event window.
    property tags : Array(Tag) | Nil

    def initialize(
      @instance_event_window_id : String | Nil = nil,
      @time_ranges : Array(InstanceEventWindowTimeRange) | Nil = nil,
      @name : String | Nil = nil,
      @cron_expression : String | Nil = nil,
      @association_target : InstanceEventWindowAssociationTarget | Nil = nil,
      @state : InstanceEventWindowState | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_event_window_id
        params << {"#{prefix}InstanceEventWindowId", value}
      end

      (@time_ranges || [] of InstanceEventWindowTimeRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TimeRangeSet.#{i}."))
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end

      if value = @cron_expression
        params << {"#{prefix}CronExpression", value}
      end

      if value = @association_target
        params.concat(value.to_query_params("#{prefix}AssociationTarget."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_event_window_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceEventWindowId']")),
        time_ranges: node.xpath_nodes("*[local-name()='timeRangeSet']/*[local-name()='item']").map { |n| InstanceEventWindowTimeRange.from_xml(n) },
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='name']")),
        cron_expression: Core::XMLValue.string(node.xpath_node("*[local-name()='cronExpression']")),
        association_target: node.xpath_node("*[local-name()='associationTarget']").try { |n| InstanceEventWindowAssociationTarget.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::InstanceEventWindowState.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @time_ranges
        value.each(&.validate!)
      end

      if value = @association_target
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@instance_event_window_id, @time_ranges, @name, @cron_expression, @association_target, @state, @tags)
  end
end
