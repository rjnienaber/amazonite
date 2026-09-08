private alias Core = Amazonite::Core

module Amazonite::S3
  # The S3 Metadata configuration for a general purpose bucket.
  class MetadataConfigurationResult
    # The destination settings for a metadata configuration.
    property destination_result : DestinationResult

    # The journal table configuration for a metadata configuration.
    property journal_table_configuration_result : JournalTableConfigurationResult | Nil

    # The inventory table configuration for a metadata configuration.
    property inventory_table_configuration_result : InventoryTableConfigurationResult | Nil

    # The annotation table configuration result, if an annotation table is configured.
    property annotation_table_configuration_result : AnnotationTableConfigurationResult | Nil

    def initialize(
      @destination_result : DestinationResult,
      @journal_table_configuration_result : JournalTableConfigurationResult | Nil = nil,
      @inventory_table_configuration_result : InventoryTableConfigurationResult | Nil = nil,
      @annotation_table_configuration_result : AnnotationTableConfigurationResult | Nil = nil,
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
      xml.element("DestinationResult") { @destination_result.build_xml(xml) }

      if value = @journal_table_configuration_result
        xml.element("JournalTableConfigurationResult") { value.build_xml(xml) }
      end

      if value = @inventory_table_configuration_result
        xml.element("InventoryTableConfigurationResult") { value.build_xml(xml) }
      end

      if value = @annotation_table_configuration_result
        xml.element("AnnotationTableConfigurationResult") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_result: node.xpath_node("*[local-name()='DestinationResult']").try { |n| DestinationResult.from_xml(n) }.not_nil!,
        journal_table_configuration_result: node.xpath_node("*[local-name()='JournalTableConfigurationResult']").try { |n| JournalTableConfigurationResult.from_xml(n) },
        inventory_table_configuration_result: node.xpath_node("*[local-name()='InventoryTableConfigurationResult']").try { |n| InventoryTableConfigurationResult.from_xml(n) },
        annotation_table_configuration_result: node.xpath_node("*[local-name()='AnnotationTableConfigurationResult']").try { |n| AnnotationTableConfigurationResult.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @destination_result
        value.validate!
      end

      if value = @journal_table_configuration_result
        value.validate!
      end

      if value = @inventory_table_configuration_result
        value.validate!
      end

      if value = @annotation_table_configuration_result
        value.validate!
      end
    end

    def_equals_and_hash(@destination_result, @journal_table_configuration_result, @inventory_table_configuration_result, @annotation_table_configuration_result)
  end
end
