private alias Core = Amazonite::Core

module Amazonite::S3
  # The S3 Metadata configuration for a general purpose bucket.
  class GetBucketMetadataConfigurationResult
    # The metadata configuration for a general purpose bucket.
    property metadata_configuration_result : MetadataConfigurationResult

    def initialize(
      @metadata_configuration_result : MetadataConfigurationResult,
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
      xml.element("MetadataConfigurationResult") { @metadata_configuration_result.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metadata_configuration_result: node.xpath_node("*[local-name()='MetadataConfigurationResult']").try { |n| MetadataConfigurationResult.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @metadata_configuration_result
        value.validate!
      end
    end

    def_equals_and_hash(@metadata_configuration_result)
  end
end
