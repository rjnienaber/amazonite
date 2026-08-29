private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ResourceDriftIgnoredAttribute
    property path : String | Nil

    property reason : DriftIgnoredReason | Nil

    def initialize(
      @path : String | Nil = nil,
      @reason : DriftIgnoredReason | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @reason
        params << {"#{prefix}Reason", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        reason: (n = node.xpath_node("*[local-name()='Reason']")) ? ACF::DriftIgnoredReason.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
