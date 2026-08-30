private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The `ResourceDriftIgnoredAttribute` data type.
  class ResourceDriftIgnoredAttribute
    # Path of the resource attribute for which drift was ignored.
    property path : String | Nil

    # Reason why drift was ignored for the attribute, can have 3 possible values:
    #
    # - `WRITE_ONLY_PROPERTY` – Property is not included in read response for the resource’s live
    # state.
    #
    # - `MANAGED_BY_AWS` – Property is managed by an Amazon Web Services service and is expected to be
    # dynamically modified.
    #
    # - `SENSITIVE_PROPERTY` – Property has a sensitive value, such as an Amazon Web Services Secrets
    # Manager value.
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
