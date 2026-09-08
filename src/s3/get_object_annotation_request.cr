private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectAnnotationRequest
    # The name of the bucket that contains the object.
    property bucket : String = ""

    # The object key.
    property key : String = ""

    # The name of the annotation to retrieve.
    #
    # Length Constraints: Minimum length of 1. Maximum length of 512 bytes.
    property annotation_name : String = ""

    # The version ID of the object.
    property version_id : String | Nil

    property request_payer : RequestPayer | Nil

    # The account ID of the expected bucket owner. If the bucket is owned by a different account, the
    # request fails with an HTTP 403 (Access Denied) error.
    property expected_bucket_owner : String | Nil

    # Set to `ENABLED` to validate the checksum of the annotation payload on retrieval.
    property checksum_mode : ChecksumMode | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @annotation_name : String,
      @version_id : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @checksum_mode : ChecksumMode | Nil = nil,
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
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@bucket, @key, @annotation_name, @version_id, @request_payer, @expected_bucket_owner, @checksum_mode)
  end
end
