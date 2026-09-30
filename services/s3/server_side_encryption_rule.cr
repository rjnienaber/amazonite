private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the default server-side encryption configuration.
  #
  # - **General purpose buckets** - If you're specifying a customer managed KMS key, we recommend
  # using a fully qualified KMS key ARN. If you use a KMS key alias instead, then KMS resolves the
  # key within the requester’s account. This behavior can result in data that's encrypted with a KMS
  # key that belongs to the requester, and not the bucket owner.
  #
  # - **Directory buckets** - When you specify an [KMS customer managed
  # key](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#customer-cmk) for
  # encryption in your directory bucket, only use the key ID or key ARN. The key alias format of the
  # KMS key isn't supported.
  class ServerSideEncryptionRule
    # Specifies the default server-side encryption to apply to new objects in the bucket. If a PUT
    # Object request doesn't specify any server-side encryption, this default encryption will be
    # applied.
    property apply_server_side_encryption_by_default : ServerSideEncryptionByDefault | Nil

    # Specifies whether Amazon S3 should use an S3 Bucket Key with server-side encryption using KMS
    # (SSE-KMS) for new objects in the bucket. Existing objects are not affected. Setting the
    # `BucketKeyEnabled` element to `true` causes Amazon S3 to use an S3 Bucket Key.
    #
    # - **General purpose buckets** - By default, S3 Bucket Key is not enabled. For more information,
    # see [Amazon S3 Bucket Keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-key.html) in
    # the *Amazon S3 User Guide*.
    #
    # - **Directory buckets** - S3 Bucket Keys are always enabled for `GET` and `PUT` operations in a
    # directory bucket and can’t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS
    # encrypted objects from general purpose buckets to directory buckets, from directory buckets to
    # general purpose buckets, or between directory buckets, through
    # [CopyObject](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html),
    # [UploadPartCopy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html), [the
    # Copy operation in Batch
    # Operations](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-objects-Batch-Ops),
    # or [the import jobs](https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-import-job).
    # In this case, Amazon S3 makes a call to KMS every time a copy request is made for a
    # KMS-encrypted object.
    property bucket_key_enabled : Bool | Nil

    # A bucket-level setting for Amazon S3 general purpose buckets used to prevent the upload of new
    # objects encrypted with the specified server-side encryption type. For example, blocking an
    # encryption type will block `PutObject`, `CopyObject`, `PostObject`, multipart upload, and
    # replication requests to the bucket for objects with the specified encryption type. However, you
    # can continue to read and list any pre-existing objects already encrypted with the specified
    # encryption type. For more information, see [Blocking or unblocking SSE-C for a general purpose
    # bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/blocking-unblocking-s3-c-encryption-gpb.html).
    #
    # Currently, this parameter only supports blocking or unblocking server-side encryption with
    # customer-provided keys (SSE-C). For more information about SSE-C, see [Using server-side
    # encryption with customer-provided keys
    # (SSE-C)](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html).
    property blocked_encryption_types : BlockedEncryptionTypes | Nil

    def initialize(
      @apply_server_side_encryption_by_default : ServerSideEncryptionByDefault | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
      @blocked_encryption_types : BlockedEncryptionTypes | Nil = nil,
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
      if value = @apply_server_side_encryption_by_default
        xml.element("ApplyServerSideEncryptionByDefault") { value.build_xml(xml) }
      end

      if value = @bucket_key_enabled
        xml.element("BucketKeyEnabled") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @blocked_encryption_types
        xml.element("BlockedEncryptionTypes") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        apply_server_side_encryption_by_default: node.xpath_node("*[local-name()='ApplyServerSideEncryptionByDefault']").try { |n| ServerSideEncryptionByDefault.from_xml(n) },
        bucket_key_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='BucketKeyEnabled']")),
        blocked_encryption_types: node.xpath_node("*[local-name()='BlockedEncryptionTypes']").try { |n| BlockedEncryptionTypes.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @apply_server_side_encryption_by_default
        value.validate!
      end

      if value = @blocked_encryption_types
        value.validate!
      end
    end

    def_equals_and_hash(@apply_server_side_encryption_by_default, @bucket_key_enabled, @blocked_encryption_types)
  end
end
