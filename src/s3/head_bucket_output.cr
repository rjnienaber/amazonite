private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class HeadBucketOutput
    # The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web Services
    # resources across all of Amazon Web Services.
    #
    # This parameter is only supported for S3 directory buckets. For more information, see [Using tags
    # with directory
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-tagging.html).
    property bucket_arn : String | Nil

    # The type of location where the bucket is created.
    #
    # This functionality is only supported by directory buckets.
    property bucket_location_type : LocationType | Nil

    # The name of the location where the bucket will be created.
    #
    # For directory buckets, the Zone ID of the Availability Zone or the Local Zone where the bucket
    # is created. An example Zone ID value for an Availability Zone is `usw2-az1`.
    #
    # This functionality is only supported by directory buckets.
    property bucket_location_name : String | Nil

    # The Region that the bucket is located.
    property bucket_region : String | Nil

    # Indicates whether the bucket name used in the request is an access point alias.
    #
    # For directory buckets, the value of this field is `false`.
    property access_point_alias : Bool | Nil

    def initialize(
      @bucket_arn : String | Nil = nil,
      @bucket_location_type : LocationType | Nil = nil,
      @bucket_location_name : String | Nil = nil,
      @bucket_region : String | Nil = nil,
      @access_point_alias : Bool | Nil = nil,
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
      if value = @bucket_arn
        raise Core::ValidationError.new("BucketArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("BucketArn length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BucketArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[^:]+:(s3|s3express):"))
      end

      if value = @bucket_region
        raise Core::ValidationError.new("BucketRegion length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("BucketRegion length must be <= 20") if value.size > 20
      end
    end

    def_equals_and_hash(@bucket_arn, @bucket_location_type, @bucket_location_name, @bucket_region, @access_point_alias)
  end
end
