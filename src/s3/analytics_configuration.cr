private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the configuration and any analyses for the analytics filter of an Amazon S3 bucket.
  class AnalyticsConfiguration
    # The ID that identifies the analytics configuration.
    property id : String

    # The filter used to describe a set of objects for analyses. A filter must have exactly one
    # prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all
    # objects will be considered in any analysis.
    property filter : AnalyticsFilter | Nil

    # Contains data related to access patterns to be collected and made available to analyze the
    # tradeoffs between different storage classes.
    property storage_class_analysis : StorageClassAnalysis

    def initialize(
      @id : String,
      @storage_class_analysis : StorageClassAnalysis,
      @filter : AnalyticsFilter | Nil = nil,
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
      xml.element("Id") { xml.text @id }

      if value = @filter
        xml.element("Filter") { value.build_xml(xml) }
      end

      xml.element("StorageClassAnalysis") { @storage_class_analysis.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| AnalyticsFilter.from_xml(n) },
        storage_class_analysis: node.xpath_node("*[local-name()='StorageClassAnalysis']").try { |n| StorageClassAnalysis.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @filter
        value.validate!
      end

      if value = @storage_class_analysis
        value.validate!
      end
    end

    def_equals_and_hash(@id, @filter, @storage_class_analysis)
  end
end
