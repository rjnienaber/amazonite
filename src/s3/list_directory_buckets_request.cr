private alias Core = Amazonite::Core

module Amazonite::S3
  class ListDirectoryBucketsRequest
    # `ContinuationToken` indicates to Amazon S3 that the list is being continued on buckets in this
    # account with a token. `ContinuationToken` is obfuscated and is not a real bucket name. You can
    # use this `ContinuationToken` for the pagination of the list results.
    property continuation_token : String | Nil

    # Maximum number of buckets to be returned in response. When the number is more than the count of
    # buckets that are owned by an Amazon Web Services account, return all the buckets in response.
    property max_directory_buckets : Int32 | Nil

    def initialize(
      @continuation_token : String | Nil = nil,
      @max_directory_buckets : Int32 | Nil = nil,
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
      if value = @continuation_token
        raise Core::ValidationError.new("ContinuationToken length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ContinuationToken length must be <= 1024") if value.size > 1024
      end

      if value = @max_directory_buckets
        raise Core::ValidationError.new("MaxDirectoryBuckets value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxDirectoryBuckets value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@continuation_token, @max_directory_buckets)
  end
end
