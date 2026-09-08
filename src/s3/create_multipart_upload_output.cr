private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CreateMultipartUploadOutput
    # If the bucket has a lifecycle rule configured with an action to abort incomplete multipart
    # uploads and the prefix in the lifecycle rule matches the object name in the request, the
    # response includes this header. The header indicates when the initiated multipart upload becomes
    # eligible for an abort operation. For more information, see [ Aborting Incomplete Multipart
    # Uploads Using a Bucket Lifecycle
    # Configuration](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html#mpu-abort-incomplete-mpu-lifecycle-config)
    # in the *Amazon S3 User Guide*.
    #
    # The response also includes the `x-amz-abort-rule-id` header that provides the ID of the
    # lifecycle configuration rule that defines the abort action.
    #
    # This functionality is not supported for directory buckets.
    property abort_date : Time | Nil

    # This header is returned along with the `x-amz-abort-date` header. It identifies the applicable
    # lifecycle configuration rule that defines the action to abort incomplete multipart uploads.
    #
    # This functionality is not supported for directory buckets.
    property abort_rule_id : String | Nil

    # The name of the bucket to which the multipart upload was initiated. Does not return the access
    # point ARN or access point alias if used.
    #
    # Access points are not supported by directory buckets.
    property bucket : String | Nil

    # Object key for which the multipart upload was initiated.
    property key : String | Nil

    # ID for the initiated multipart upload.
    property upload_id : String | Nil

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
    # encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, which
    # contains the encryption context as key-value pairs.
    property ssekms_encryption_context : String | Nil

    # Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS).
    property bucket_key_enabled : Bool | Nil

    property request_charged : RequestCharged | Nil

    # The algorithm that was used to create a checksum of the object.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # Indicates the checksum type that you want Amazon S3 to use to calculate the object’s checksum
    # value. For more information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_type : ChecksumType | Nil

    def initialize(
      @abort_date : Time | Nil = nil,
      @abort_rule_id : String | Nil = nil,
      @bucket : String | Nil = nil,
      @key : String | Nil = nil,
      @upload_id : String | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @ssekms_encryption_context : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @checksum_type : ChecksumType | Nil = nil,
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
      if value = @bucket
        xml.element("Bucket") { xml.text value }
      end

      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @upload_id
        xml.element("UploadId") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")),
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        upload_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UploadId']")),
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@abort_date, @abort_rule_id, @bucket, @key, @upload_id, @server_side_encryption, @sse_customer_algorithm, @sse_customer_key_md5, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled, @request_charged, @checksum_algorithm, @checksum_type)
  end
end
