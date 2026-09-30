private alias Core = Amazonite::Core

module Amazonite::S3
  # The S3 Metadata configuration for a general purpose bucket.
  class MetadataConfiguration
    # The journal table configuration for a metadata configuration.
    property journal_table_configuration : JournalTableConfiguration

    # The inventory table configuration for a metadata configuration.
    property inventory_table_configuration : InventoryTableConfiguration | Nil

    # Optional annotation table configuration to include with the metadata configuration.
    property annotation_table_configuration : AnnotationTableConfiguration | Nil

    def initialize(
      @journal_table_configuration : JournalTableConfiguration,
      @inventory_table_configuration : InventoryTableConfiguration | Nil = nil,
      @annotation_table_configuration : AnnotationTableConfiguration | Nil = nil,
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
      xml.element("JournalTableConfiguration") { @journal_table_configuration.build_xml(xml) }

      if value = @inventory_table_configuration
        xml.element("InventoryTableConfiguration") { value.build_xml(xml) }
      end

      if value = @annotation_table_configuration
        xml.element("AnnotationTableConfiguration") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        journal_table_configuration: node.xpath_node("*[local-name()='JournalTableConfiguration']").try { |n| JournalTableConfiguration.from_xml(n) }.not_nil!,
        inventory_table_configuration: node.xpath_node("*[local-name()='InventoryTableConfiguration']").try { |n| InventoryTableConfiguration.from_xml(n) },
        annotation_table_configuration: node.xpath_node("*[local-name()='AnnotationTableConfiguration']").try { |n| AnnotationTableConfiguration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @journal_table_configuration
        value.validate!
      end

      if value = @inventory_table_configuration
        value.validate!
      end

      if value = @annotation_table_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@journal_table_configuration, @inventory_table_configuration, @annotation_table_configuration)
  end
end
