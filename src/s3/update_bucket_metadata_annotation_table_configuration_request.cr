private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class UpdateBucketMetadataAnnotationTableConfigurationRequest
    # The name of the bucket whose annotation table configuration to update.
    property bucket : String = ""

    # Base64-encoded MD5 digest of the message body.
    property content_md5 : String | Nil

    # Checksum algorithm for the request payload.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # The annotation table configuration updates to apply.
    property annotation_table_configuration : AnnotationTableConfigurationUpdates

    # The account ID of the expected bucket owner.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @annotation_table_configuration : AnnotationTableConfigurationUpdates,
      @content_md5 : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
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
      if value = @annotation_table_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @content_md5, @checksum_algorithm, @annotation_table_configuration, @expected_bucket_owner)
  end
end
