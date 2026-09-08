private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies updates to apply to the annotation table configuration. Used as the request body for
  # `UpdateBucketMetadataAnnotationTableConfiguration`.
  class AnnotationTableConfigurationUpdates
    # The new configuration state to apply.
    property configuration_state : AnnotationConfigurationState

    property encryption_configuration : MetadataTableEncryptionConfiguration | Nil

    # The new IAM role ARN to apply.
    property role : String | Nil

    def initialize(
      @configuration_state : AnnotationConfigurationState,
      @encryption_configuration : MetadataTableEncryptionConfiguration | Nil = nil,
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

      if value = @encryption_configuration
        xml.element("EncryptionConfiguration") { value.build_xml(xml) }
      end

      if value = @role
        xml.element("Role") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        configuration_state: ((n = node.xpath_node("*[local-name()='ConfigurationState']")) ? AS::AnnotationConfigurationState.from_json_object_key?(n.content) : nil).not_nil!,
        encryption_configuration: node.xpath_node("*[local-name()='EncryptionConfiguration']").try { |n| MetadataTableEncryptionConfiguration.from_xml(n) },
        role: Core::XMLValue.string(node.xpath_node("*[local-name()='Role']")),
      )
    end

    def validate! : Nil
      if value = @encryption_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@configuration_state, @encryption_configuration, @role)
  end
end
