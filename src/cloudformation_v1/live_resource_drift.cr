private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class LiveResourceDrift
    property previous_value : String | Nil

    property actual_value : String | Nil

    property drift_detection_timestamp : Time | Nil

    def initialize(
      @previous_value : String | Nil = nil,
      @actual_value : String | Nil = nil,
      @drift_detection_timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @previous_value
        params << {"#{prefix}PreviousValue", value}
      end

      if value = @actual_value
        params << {"#{prefix}ActualValue", value}
      end

      if value = @drift_detection_timestamp
        params << {"#{prefix}DriftDetectionTimestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        previous_value: Core::XMLValue.string(node.xpath_node("*[local-name()='PreviousValue']")),
        actual_value: Core::XMLValue.string(node.xpath_node("*[local-name()='ActualValue']")),
        drift_detection_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='DriftDetectionTimestamp']")),
      )
    end
  end
end
