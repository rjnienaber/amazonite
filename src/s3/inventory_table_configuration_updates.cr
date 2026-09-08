private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The specified updates to the S3 Metadata inventory table configuration.
  class InventoryTableConfigurationUpdates
    # The configuration state of the inventory table, indicating whether the inventory table is
    # enabled or disabled.
    property configuration_state : InventoryConfigurationState

    # The encryption configuration for the inventory table.
    property encryption_configuration : MetadataTableEncryptionConfiguration | Nil

    def initialize(
      @configuration_state : InventoryConfigurationState,
      @encryption_configuration : MetadataTableEncryptionConfiguration | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
        configuration_state: ((n = node.xpath_node("*[local-name()='ConfigurationState']")) ? AS::InventoryConfigurationState.from_json_object_key?(n.content) : nil).not_nil!,
        encryption_configuration: node.xpath_node("*[local-name()='EncryptionConfiguration']").try { |n| MetadataTableEncryptionConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @encryption_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@configuration_state, @encryption_configuration)
  end
end
