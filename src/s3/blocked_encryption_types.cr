private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # A bucket-level setting for Amazon S3 general purpose buckets used to prevent the upload of new
  # objects encrypted with the specified server-side encryption type. For example, blocking an
  # encryption type will block `PutObject`, `CopyObject`, `PostObject`, multipart upload, and
  # replication requests to the bucket for objects with the specified encryption type. However, you
  # can continue to read and list any pre-existing objects already encrypted with the specified
  # encryption type. For more information, see [Blocking or unblocking SSE-C for a general purpose
  # bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/blocking-unblocking-s3-c-encryption-gpb.html).
  #
  # This data type is used with the following actions:
  #
  # -
  # [PutBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html)
  #
  # -
  # [GetBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html)
  #
  # -
  # [DeleteBucketEncryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html)
  #
  # Permissions You must have the `s3:PutEncryptionConfiguration` permission to block or unblock an
  # encryption type for a bucket.
  #
  # You must have the `s3:GetEncryptionConfiguration` permission to view a bucket's encryption type.
  class BlockedEncryptionTypes
    # The object encryption type that you want to block or unblock for an Amazon S3 general purpose
    # bucket.
    #
    # Currently, this parameter only supports blocking or unblocking server side encryption with
    # customer-provided keys (SSE-C). For more information about SSE-C, see [Using server-side
    # encryption with customer-provided keys
    # (SSE-C)](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html).
    property encryption_type : Array(EncryptionType) | Nil

    def initialize(
      @encryption_type : Array(EncryptionType) | Nil = nil,
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
      (@encryption_type || [] of EncryptionType).each do |item|
        xml.element("EncryptionType") { xml.text item.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        encryption_type: node.xpath_nodes("*[local-name()='EncryptionType']").compact_map { |n| AS::EncryptionType.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@encryption_type)
  end
end
