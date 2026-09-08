private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CreateBucketRequest
    # The canned ACL to apply to the bucket.
    #
    # This functionality is not supported for directory buckets.
    property acl : BucketCannedACL | Nil

    # The name of the bucket to create.
    #
    # **General purpose buckets** - For information about bucket naming restrictions, see [Bucket
    # naming rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html) in
    # the *Amazon S3 User Guide*.
    #
    # **Directory buckets ** - When you use this operation with a directory bucket, you must use
    # path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. Directory bucket names must be unique in the chosen Zone
    # (Availability Zone or Local Zone). Bucket names must also follow the format `
    # *bucket-base-name*--*zone-id*--x-s3` (for example, ` *DOC-EXAMPLE-BUCKET*--*usw2-az1*--x-s3`).
    # For information about bucket naming restrictions, see [Directory bucket naming
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html)
    # in the *Amazon S3 User Guide*
    property bucket : String = ""

    # The configuration information for the bucket.
    property create_bucket_configuration : CreateBucketConfiguration | Nil

    # Allows grantee the read, write, read ACP, and write ACP permissions on the bucket.
    #
    # This functionality is not supported for directory buckets.
    property grant_full_control : String | Nil

    # Allows grantee to list the objects in the bucket.
    #
    # This functionality is not supported for directory buckets.
    property grant_read : String | Nil

    # Allows grantee to read the bucket ACL.
    #
    # This functionality is not supported for directory buckets.
    property grant_read_acp : String | Nil

    # Allows grantee to create new objects in the bucket.
    #
    # For the bucket and object owners of existing objects, also allows deletions and overwrites of
    # those objects.
    #
    # This functionality is not supported for directory buckets.
    property grant_write : String | Nil

    # Allows grantee to write the ACL for the applicable bucket.
    #
    # This functionality is not supported for directory buckets.
    property grant_write_acp : String | Nil

    # Specifies whether you want S3 Object Lock to be enabled for the new bucket.
    #
    # This functionality is not supported for directory buckets.
    property object_lock_enabled_for_bucket : Bool | Nil

    property object_ownership : ObjectOwnership | Nil

    # Specifies the namespace where you want to create your general purpose bucket. When you create a
    # general purpose bucket, you can choose to create a bucket in the shared global namespace or you
    # can choose to create a bucket in your account regional namespace. Your account regional
    # namespace is a subdivision of the global namespace that only your account can create buckets in.
    # For more information on bucket namespaces, see [Namespaces for general purpose
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/gpbucketnamespaces.html).
    #
    # General purpose buckets in your account regional namespace must follow a specific naming
    # convention. These buckets consist of a bucket name prefix that you create, and a suffix that
    # contains your 12-digit Amazon Web Services Account ID, the Amazon Web Services Region code, and
    # ends with `-an`. Bucket names must follow the format `bucket-name-prefix-accountId-region-an`
    # (for example, `amzn-s3-demo-bucket-111122223333-us-west-2-an`). For information about bucket
    # naming restrictions, see [Account regional namespace naming
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html#account-regional-naming-rules)
    # in the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property bucket_namespace : BucketNamespace | Nil

    def initialize(
      @bucket : String,
      @acl : BucketCannedACL | Nil = nil,
      @create_bucket_configuration : CreateBucketConfiguration | Nil = nil,
      @grant_full_control : String | Nil = nil,
      @grant_read : String | Nil = nil,
      @grant_read_acp : String | Nil = nil,
      @grant_write : String | Nil = nil,
      @grant_write_acp : String | Nil = nil,
      @object_lock_enabled_for_bucket : Bool | Nil = nil,
      @object_ownership : ObjectOwnership | Nil = nil,
      @bucket_namespace : BucketNamespace | Nil = nil,
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
      if value = @create_bucket_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@acl, @bucket, @create_bucket_configuration, @grant_full_control, @grant_read, @grant_read_acp, @grant_write, @grant_write_acp, @object_lock_enabled_for_bucket, @object_ownership, @bucket_namespace)
  end
end
