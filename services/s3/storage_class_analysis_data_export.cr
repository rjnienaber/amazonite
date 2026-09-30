private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for data related to the storage class analysis for an Amazon S3 bucket for export.
  class StorageClassAnalysisDataExport
    # The version of the output schema to use when exporting data. Must be `V_1`.
    property output_schema_version : StorageClassAnalysisSchemaVersion

    # The place to store the data for an analysis.
    property destination : AnalyticsExportDestination

    def initialize(
      @output_schema_version : StorageClassAnalysisSchemaVersion,
      @destination : AnalyticsExportDestination,
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
      xml.element("OutputSchemaVersion") { xml.text @output_schema_version.to_json_object_key }

      xml.element("Destination") { @destination.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        output_schema_version: ((n = node.xpath_node("*[local-name()='OutputSchemaVersion']")) ? AS::StorageClassAnalysisSchemaVersion.from_json_object_key?(n.content) : nil).not_nil!,
        destination: node.xpath_node("*[local-name()='Destination']").try { |n| AnalyticsExportDestination.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @destination
        value.validate!
      end
    end

    def_equals_and_hash(@output_schema_version, @destination)
  end
end
