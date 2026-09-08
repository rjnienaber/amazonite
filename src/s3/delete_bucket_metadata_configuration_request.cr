module Amazonite::S3
  class DeleteBucketMetadataConfigurationRequest
    # The general purpose bucket that you want to remove the metadata configuration from.
    property bucket : String = ""

    # The expected bucket owner of the general purpose bucket that you want to remove the metadata
    # table configuration from.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @expected_bucket_owner : String | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@bucket, @expected_bucket_owner)
  end
end
