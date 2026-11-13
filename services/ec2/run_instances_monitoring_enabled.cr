private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the monitoring of an instance.
  class RunInstancesMonitoringEnabled
    # The IDs of the metric categories to associate with the instance. To specify metric categories,
    # you must also enable detailed monitoring.
    property metric_category_ids : Array(String) | Nil

    # Indicates whether detailed monitoring is enabled. Otherwise, basic monitoring is enabled.
    property enabled : Bool

    def initialize(
      @enabled : Bool,
      @metric_category_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@metric_category_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MetricCategoryId.#{i}", item}
      end

      params << {"#{prefix}Enabled", Core::QueryValue.bool(@enabled)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_category_ids: node.xpath_nodes("*[local-name()='MetricCategoryId']/*[local-name()='item']").map { |n| n.content },
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enabled']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@metric_category_ids, @enabled)
  end
end
