private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListObjectAnnotationsRequest
    # The name of the bucket that contains the object.
    property bucket : String = ""

    # The object key.
    property key : String = ""

    # The version ID of the object.
    property version_id : String | Nil

    # The maximum number of annotations to return in the response. Maximum is 1,000.
    property max_annotation_results : Int32 | Nil

    # Filter results to annotations whose name begins with the specified prefix.
    property annotation_prefix : String | Nil

    # Continuation token returned by a previous request to retrieve the next page.
    property continuation_token : String | Nil

    property request_payer : RequestPayer | Nil

    # The account ID of the expected bucket owner.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @version_id : String | Nil = nil,
      @max_annotation_results : Int32 | Nil = nil,
      @annotation_prefix : String | Nil = nil,
      @continuation_token : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
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
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end

      if value = @max_annotation_results
        raise Core::ValidationError.new("MaxAnnotationResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxAnnotationResults value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@bucket, @key, @version_id, @max_annotation_results, @annotation_prefix, @continuation_token, @request_payer, @expected_bucket_owner)
  end
end
