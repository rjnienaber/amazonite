private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class PutBucketLifecycleConfigurationRequest
    # The name of the bucket for which to set the configuration.
    property bucket : String = ""

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

    # Container for lifecycle rules. You can add as many as 1,000 rules.
    property lifecycle_configuration : BucketLifecycleConfiguration | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property expected_bucket_owner : String | Nil

    # Indicates which default minimum object size behavior is applied to the lifecycle configuration.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    #
    # - `all_storage_classes_128K` - Objects smaller than 128 KB will not transition to any storage
    # class by default.
    #
    # - `varies_by_storage_class` - Objects smaller than 128 KB will transition to Glacier Flexible
    # Retrieval or Glacier Deep Archive storage classes. By default, all other storage classes will
    # prevent transitions smaller than 128 KB.
    #
    # To customize the minimum object size for any transition you can add a filter that specifies a
    # custom `ObjectSizeGreaterThan` or `ObjectSizeLessThan` in the body of your transition rule.
    # Custom filters always take precedence over the default transition behavior.
    property transition_default_minimum_object_size : TransitionDefaultMinimumObjectSize | Nil

    def initialize(
      @bucket : String,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @lifecycle_configuration : BucketLifecycleConfiguration | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @transition_default_minimum_object_size : TransitionDefaultMinimumObjectSize | Nil = nil,
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
      if value = @lifecycle_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @checksum_algorithm, @lifecycle_configuration, @expected_bucket_owner, @transition_default_minimum_object_size)
  end
end
