private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the monitoring for the instance.
  class LaunchTemplatesMonitoringRequest
    # Specify `true` to enable detailed monitoring. Otherwise, basic monitoring is enabled.
    property enabled : Bool | Nil

    # The IDs of the metric categories to associate with the instance. To specify metric categories,
    # you must also enable detailed monitoring.
    property metric_category_ids : Array(String) | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @metric_category_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end

      (@metric_category_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MetricCategoryId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
        metric_category_ids: node.xpath_nodes("*[local-name()='MetricCategoryId']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @metric_category_ids)
  end
end
