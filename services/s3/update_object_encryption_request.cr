private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class UpdateObjectEncryptionRequest
    # The name of the general purpose bucket that contains the specified object key name.
    #
    # When you use this operation with an access point attached to a general purpose bucket, you must
    # either provide the alias of the access point in place of the bucket name or you must specify the
    # access point Amazon Resource Name (ARN). When using the access point ARN, you must direct
    # requests to the access point hostname. The access point hostname takes the form `
    # *AccessPointName*-*AccountId*.s3-accesspoint.*Region*.amazonaws.com`. When using this operation
    # with an access point through the Amazon Web Services SDKs, you provide the access point ARN in
    # place of the bucket name. For more information about access point ARNs, see [ Referencing access
    # points](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-naming.html) in the
    # *Amazon S3 User Guide*.
    property bucket : String = ""

    # The key name of the object that you want to update the server-side encryption type for.
    property key : String = ""

    # The version ID of the object that you want to update the server-side encryption type for.
    property version_id : String | Nil

    # The updated server-side encryption type for this object. The `UpdateObjectEncryption` operation
    # supports the SSE-S3 and SSE-KMS encryption types.
    #
    # Valid Values: `SSES3` | `SSEKMS`
    property object_encryption : ObjectEncryption

    property request_payer : RequestPayer | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide doesn't match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # The MD5 hash for the request body. For requests made using the Amazon Web Services Command Line
    # Interface (CLI) or Amazon Web Services SDKs, this field is calculated automatically.
    property content_md5 : String | Nil

    # Indicates the algorithm used to create the checksum for the object when you use an Amazon Web
    # Services SDK. This header doesn't provide any additional functionality if you don't use the SDK.
    # When you send this header, there must be a corresponding `x-amz-checksum` or `x-amz-trailer`
    # header sent. Otherwise, Amazon S3 fails the request with the HTTP status code `400 Bad Request`.
    # For more information, see [ Checking object integrity
    # ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html) in the
    # *Amazon S3 User Guide*.
    #
    # If you provide an individual checksum, Amazon S3 ignores any provided `ChecksumAlgorithm`
    # parameter.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @object_encryption : ObjectEncryption,
      @version_id : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @content_md5 : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
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

      if value = @object_encryption
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @key, @version_id, @object_encryption, @request_payer, @expected_bucket_owner, @content_md5, @checksum_algorithm)
  end
end
