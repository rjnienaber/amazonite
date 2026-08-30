private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # Contains drift information for a resource property, including actual value, previous deployment
  # value, and drift detection timestamp.
  class LiveResourceDrift
    # The configuration value from the previous CloudFormation deployment.
    property previous_value : String | Nil

    # The current live configuration value of the resource property.
    property actual_value : String | Nil

    # The timestamp when drift was detected for this resource property.
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

    def validate! : Nil
    end

    def_equals_and_hash(@previous_value, @actual_value, @drift_detection_timestamp)
  end
end
