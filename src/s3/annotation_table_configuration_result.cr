private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Contains the current state of the annotation table associated with a bucket's Amazon S3 Metadata
  # configuration, including its provisioning status and identifiers.
  class AnnotationTableConfigurationResult
    # The current configuration state of the annotation table.
    property configuration_state : AnnotationConfigurationState

    # The provisioning status of the annotation table. Possible values: `CREATING`, `BACKFILLING`,
    # `ACTIVE`, `FAILED`.
    property table_status : String | Nil

    property error : ErrorDetails | Nil

    # The name of the annotation table.
    property table_name : String | Nil

    # The ARN of the annotation table.
    property table_arn : String | Nil

    # The ARN of the IAM role associated with the annotation table.
    property role : String | Nil

    def initialize(
      @configuration_state : AnnotationConfigurationState,
      @table_status : String | Nil = nil,
      @error : ErrorDetails | Nil = nil,
      @table_name : String | Nil = nil,
      @table_arn : String | Nil = nil,
      @role : String | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      xml.element("ConfigurationState") { xml.text @configuration_state.to_json_object_key }

      if value = @table_status
        xml.element("TableStatus") { xml.text value }
      end

      if value = @error
        xml.element("Error") { value.build_xml(xml) }
      end

      if value = @table_name
        xml.element("TableName") { xml.text value }
      end

      if value = @table_arn
        xml.element("TableArn") { xml.text value }
      end

      if value = @role
        xml.element("Role") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        configuration_state: ((n = node.xpath_node("*[local-name()='ConfigurationState']")) ? AS::AnnotationConfigurationState.from_json_object_key?(n.content) : nil).not_nil!,
        table_status: Core::XMLValue.string(node.xpath_node("*[local-name()='TableStatus']")),
        error: node.xpath_node("*[local-name()='Error']").try { |n| ErrorDetails.from_xml(n) },
        table_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TableName']")),
        table_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TableArn']")),
        role: Core::XMLValue.string(node.xpath_node("*[local-name()='Role']")),
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@configuration_state, @table_status, @error, @table_name, @table_arn, @role)
  end
end
