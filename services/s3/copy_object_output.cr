private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CopyObjectOutput
    # Container for all response elements.
    property copy_object_result : CopyObjectResult | Nil

    # If the object expiration is configured, the response includes this header.
    #
    # Object expiration information is not returned in directory buckets and this header returns the
    # value "`NotImplemented`" in all responses for directory buckets.
    property expiration : String | Nil

    # Version ID of the source object that was copied.
    #
    # This functionality is not supported when the source object is in a directory bucket.
    property copy_source_version_id : String | Nil

    # Version ID of the newly created copy.
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
    #
    # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid
    # server side encryption option is `aws:fsx`.
    property server_side_encryption : ServerSideEncryption | Nil

    # If server-side encryption with a customer-provided encryption key was requested, the response
    # will include this header to confirm the encryption algorithm that's used.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # If server-side encryption with a customer-provided encryption key was requested, the response
    # will include this header to provide the round-trip message integrity verification of the
    # customer-provided encryption key.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key_md5 : String | Nil

    # If present, indicates the ID of the KMS key that was used for object encryption.
    property ssekms_key_id : String | Nil

    # If present, indicates the Amazon Web Services KMS Encryption Context to use for object
    # encryption. The value of this header is a Base64 encoded UTF-8 string holding JSON with the
    # encryption context key-value pairs.
    property ssekms_encryption_context : String | Nil

    # Indicates whether the copied object uses an S3 Bucket Key for server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS).
    property bucket_key_enabled : Bool | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @copy_object_result : CopyObjectResult | Nil = nil,
      @expiration : String | Nil = nil,
      @copy_source_version_id : String | Nil = nil,
      @version_id : String | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @ssekms_encryption_context : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
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
      if value = @copy_object_result
        value.validate!
      end
    end

    def_equals_and_hash(@copy_object_result, @expiration, @copy_source_version_id, @version_id, @server_side_encryption, @sse_customer_algorithm, @sse_customer_key_md5, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled, @request_charged)
  end
end
