private alias AS = Amazonite::S3

module Amazonite::S3
  class CreateSessionRequest
    # Specifies the mode of the session that will be created, either `ReadWrite` or `ReadOnly`. If no
    # session mode is specified, the default behavior attempts to create a session with the maximum
    # allowable privilege. It will first attempt to create a `ReadWrite` session, and if that is not
    # allowed by permissions, it will attempt to create a `ReadOnly` session. If neither session type
    # is allowed, the request will return an Access Denied error. A `ReadWrite` session is capable of
    # executing all the Zonal endpoint API operations on a directory bucket. A `ReadOnly` session is
    # constrained to execute the following Zonal endpoint API operations: `GetObject`, `HeadObject`,
    # `ListObjectsV2`, `GetObjectAttributes`, `ListParts`, and `ListMultipartUploads`.
    property session_mode : SessionMode | Nil

    # The name of the bucket that you create a session for.
    property bucket : String = ""

    # The server-side encryption algorithm to use when you store objects in the directory bucket.
    #
    # For directory buckets, there are only two supported options for server-side encryption:
    # server-side encryption with Amazon S3 managed keys (SSE-S3) (`AES256`) and server-side
    # encryption with KMS keys (SSE-KMS) (`aws:kms`). By default, Amazon S3 encrypts data with SSE-S3.
    # For more information, see [Protecting data with server-side
    # encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/serv-side-encryption.html) in
    # the *Amazon S3 User Guide*.
    #
    # **S3 access points for Amazon FSx ** - When accessing data stored in Amazon FSx file systems
    # using S3 access points, the only valid server side encryption option is `aws:fsx`. All Amazon
    # FSx file systems have encryption configured by default and are encrypted at rest. Data is
    # automatically encrypted before being written to the file system, and automatically decrypted as
    # it is read. These processes are handled transparently by Amazon FSx.
    property server_side_encryption : ServerSideEncryption | Nil

    # If you specify `x-amz-server-side-encryption` with `aws:kms`, you must specify the `
    # x-amz-server-side-encryption-aws-kms-key-id` header with the ID (Key ID or Key ARN) of the KMS
    # symmetric encryption customer managed key to use. Otherwise, you get an HTTP `400 Bad Request`
    # error. Only use the key ID or key ARN. The key alias format of the KMS key isn't supported.
    # Also, if the KMS key doesn't exist in the same account that't issuing the command, you must use
    # the full Key ARN not the Key ID.
    #
    # Your SSE-KMS configuration can only support 1 [customer managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk) per
    # directory bucket's lifetime. The [Amazon Web Services managed
    # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk)
    # (`aws/s3`) isn't supported.
    property ssekms_key_id : String | Nil

    # Specifies the Amazon Web Services KMS Encryption Context as an additional encryption context to
    # use for object encryption. The value of this header is a Base64 encoded string of a UTF-8
    # encoded JSON, which contains the encryption context as key-value pairs. This value is stored as
    # object metadata and automatically gets passed on to Amazon Web Services KMS for future
    # `GetObject` operations on this object.
    #
    # **General purpose buckets** - This value must be explicitly added during `CopyObject` operations
    # if you want an additional encryption context for your object. For more information, see
    # [Encryption
    # context](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html#encryption-context)
    # in the *Amazon S3 User Guide*.
    #
    # **Directory buckets** - You can optionally provide an explicit encryption context value. The
    # value must match the default encryption context - the bucket Amazon Resource Name (ARN). An
    # additional encryption context value is not supported.
    property ssekms_encryption_context : String | Nil

    # Specifies whether Amazon S3 should use an S3 Bucket Key for object encryption with server-side
    # encryption using KMS keys (SSE-KMS).
    #
    # S3 Bucket Keys are always enabled for `GET` and `PUT` operations in a directory bucket and can’t
    # be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS encrypted objects from
    # general purpose buckets to directory buckets, from directory buckets to general purpose buckets,
    # or between directory buckets, through
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html),
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html), [the
    # Copy operation in Batch
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops),
    # or [the import jobs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job).
    # In this case, Amazon S3 makes a call to KMS every time a copy request is made for a
    # KMS-encrypted object.
    property bucket_key_enabled : Bool | Nil

    def initialize(
      @bucket : String,
      @session_mode : SessionMode | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @ssekms_encryption_context : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
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

    def_equals_and_hash(@session_mode, @bucket, @server_side_encryption, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled)
  end
end
