private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies data related to access patterns to be collected and made available to analyze the
  # tradeoffs between different storage classes for an Amazon S3 bucket.
  class StorageClassAnalysis
    # Specifies how data related to the storage class analysis for an Amazon S3 bucket should be
    # exported.
    property data_export : StorageClassAnalysisDataExport | Nil

    def initialize(
      @data_export : StorageClassAnalysisDataExport | Nil = nil,
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
      if value = @data_export
        xml.element("DataExport") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        data_export: node.xpath_node("*[local-name()='DataExport']").try { |n| StorageClassAnalysisDataExport.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @data_export
        value.validate!
      end
    end

    def_equals_and_hash(@data_export)
  end
end
