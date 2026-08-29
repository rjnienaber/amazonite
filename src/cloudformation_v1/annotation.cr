private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class Annotation
    property annotation_name : String | Nil

    property status : AnnotationStatus | Nil

    property status_message : String | Nil

    property remediation_message : String | Nil

    property remediation_link : String | Nil

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
  end
end
