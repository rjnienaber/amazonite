private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # The `Annotation` data type.
  #
  # A `GetHookResult` call returns detailed information and remediation guidance from Control Tower,
  # Guard, Lambda, or custom Hooks for a Hook invocation result.
  class Annotation
    # An identifier for the evaluation logic that was used when invoking the Hook. For Control Tower,
    # this is the control ID. For Guard, this is the rule ID. For Lambda and custom Hooks, this is a
    # user-defined identifier.
    property annotation_name : String | Nil

    # The status of the Hook invocation from the downstream service.
    property status : AnnotationStatus | Nil

    # The explanation for the specific status assigned to this Hook invocation. For example, "Bucket
    # does not block public access".
    property status_message : String | Nil

    # Suggests what to change if your Hook returns a `FAILED` status. For example, "Block public
    # access to the bucket".
    property remediation_message : String | Nil

    # A URL that you can access for additional remediation guidance.
    property remediation_link : String | Nil

    # The relative risk associated with any violations of this type.
    property severity_level : AnnotationSeverityLevel | Nil

    def initialize(
      @annotation_name : String | Nil = nil,
      @status : AnnotationStatus | Nil = nil,
      @status_message : String | Nil = nil,
      @remediation_message : String | Nil = nil,
      @remediation_link : String | Nil = nil,
      @severity_level : AnnotationSeverityLevel | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @annotation_name
        params << {"#{prefix}AnnotationName", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @status_message
        params << {"#{prefix}StatusMessage", value}
      end

      if value = @remediation_message
        params << {"#{prefix}RemediationMessage", value}
      end

      if value = @remediation_link
        params << {"#{prefix}RemediationLink", value}
      end

      if value = @severity_level
        params << {"#{prefix}SeverityLevel", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        annotation_name: Core::XMLValue.string(node.xpath_node("*[local-name()='AnnotationName']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? ACF::AnnotationStatus.from_json_object_key?(n.content) : nil,
        status_message: Core::XMLValue.string(node.xpath_node("*[local-name()='StatusMessage']")),
        remediation_message: Core::XMLValue.string(node.xpath_node("*[local-name()='RemediationMessage']")),
        remediation_link: Core::XMLValue.string(node.xpath_node("*[local-name()='RemediationLink']")),
        severity_level: (n = node.xpath_node("*[local-name()='SeverityLevel']")) ? ACF::AnnotationSeverityLevel.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @annotation_name
        raise Core::ValidationError.new("AnnotationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AnnotationName length must be <= 1024") if value.size > 1024
      end

      if value = @status_message
        raise Core::ValidationError.new("StatusMessage length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatusMessage length must be <= 16384") if value.size > 16384
      end

      if value = @remediation_message
        raise Core::ValidationError.new("RemediationMessage length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RemediationMessage length must be <= 16384") if value.size > 16384
      end

      if value = @remediation_link
        raise Core::ValidationError.new("RemediationLink length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RemediationLink length must be <= 5120") if value.size > 5120
      end
    end

    def_equals_and_hash(@annotation_name, @status, @status_message, @remediation_message, @remediation_link, @severity_level)
  end
end
