private alias Core = Amazonite::Core

module Amazonite::S3
  class ListBucketsRequest
    # Maximum number of buckets to be returned in response. When the number is more than the count of
    # buckets that are owned by an Amazon Web Services account, return all the buckets in response.
    property max_buckets : Int32 | Nil

    # `ContinuationToken` indicates to Amazon S3 that the list is being continued on this bucket with
    # a token. `ContinuationToken` is obfuscated and is not a real key. You can use this
    # `ContinuationToken` for pagination of the list results.
    #
    # Length Constraints: Minimum length of 0. Maximum length of 1024.
    #
    # Required: No.
    #
    # If you specify the `bucket-region`, `prefix`, or `continuation-token` query parameters without
    # using `max-buckets` to set the maximum number of buckets returned in the response, Amazon S3
    # applies a default page size of 10,000 and provides a continuation token if there are more
    # buckets.
    property continuation_token : String | Nil

    # Limits the response to bucket names that begin with the specified bucket name prefix.
    property prefix : String | Nil

    # Limits the response to buckets that are located in the specified Amazon Web Services Region. The
    # Amazon Web Services Region must be expressed according to the Amazon Web Services Region code,
    # such as `us-west-2` for the US West (Oregon) Region. For a list of the valid values for all of
    # the Amazon Web Services Regions, see [Regions and
    # Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region).
    #
    # Requests made to a Regional endpoint that is different from the `bucket-region` parameter are
    # not supported. For example, if you want to limit the response to your buckets in Region
    # `us-west-2`, the request must be made to an endpoint in Region `us-west-2`.
    property bucket_region : String | Nil

    def initialize(
      @max_buckets : Int32 | Nil = nil,
      @continuation_token : String | Nil = nil,
      @prefix : String | Nil = nil,
      @bucket_region : String | Nil = nil,
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
      if value = @max_buckets
        raise Core::ValidationError.new("MaxBuckets value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxBuckets value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@max_buckets, @continuation_token, @prefix, @bucket_region)
  end
end
