private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class PutBucketAclRequest
    # The canned ACL to apply to the bucket.
    property acl : BucketCannedACL | Nil

    # Contains the elements that set the ACL permissions for an object per grantee.
    property access_control_policy : AccessControlPolicy | Nil

    # The bucket to which to apply the ACL.
    property bucket : String = ""

    # The Base64 encoded 128-bit `MD5` digest of the data. This header must be used as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, go to [RFC 1864.](http://www.ietf.org/rfc/rfc1864.txt)
    #
    # For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
    # Services SDKs, this field is calculated automatically.
    property content_md5 : String | Nil

    # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
    # header will not provide any additional functionality if you don't use the SDK. When you send
    # this header, there must be a corresponding `x-amz-checksum` or `x-amz-trailer` header sent.
    # Otherwise, Amazon S3 fails the request with the HTTP status code `400 Bad Request`. For more
    # information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    #
    # If you provide an individual checksum, Amazon S3 ignores any provided `ChecksumAlgorithm`
    # parameter.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.
    property grant_full_control : String | Nil

    # Allows grantee to list the objects in the bucket.
    property grant_read : String | Nil

    # Allows grantee to read the bucket ACL.
    property grant_read_acp : String | Nil

    # Allows grantee to create new objects in the bucket.
    #
    # For the bucket and object owners of existing objects, also allows deletions and overwrites of
    # those objects.
    property grant_write : String | Nil

    # Allows grantee to write the ACL for the applicable bucket.
    property grant_write_acp : String | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @acl : BucketCannedACL | Nil = nil,
      @access_control_policy : AccessControlPolicy | Nil = nil,
      @content_md5 : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @grant_full_control : String | Nil = nil,
      @grant_read : String | Nil = nil,
      @grant_read_acp : String | Nil = nil,
      @grant_write : String | Nil = nil,
      @grant_write_acp : String | Nil = nil,
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
      if value = @access_control_policy
        value.validate!
      end
    end

    def_equals_and_hash(@acl, @access_control_policy, @bucket, @content_md5, @checksum_algorithm, @grant_full_control, @grant_read, @grant_read_acp, @grant_write, @grant_write_acp, @expected_bucket_owner)
  end
end
