private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the monitoring of an instance.
  class Monitoring
    # The IDs of the metric categories that are associated with the instance.
    property metric_category_ids : Array(String) | Nil

    # Indicates whether detailed monitoring is enabled. Otherwise, basic monitoring is enabled.
    property state : MonitoringState | Nil

    def initialize(
      @metric_category_ids : Array(String) | Nil = nil,
      @state : MonitoringState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@metric_category_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}MetricCategoryIdSet.#{i}", item}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_category_ids: node.xpath_nodes("*[local-name()='metricCategoryIdSet']/*[local-name()='item']").map { |n| n.content },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::MonitoringState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@metric_category_ids, @state)
  end
end
