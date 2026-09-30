private alias Core = Amazonite::Core

module Amazonite::S3
  class ListBucketsOutput
    # The list of buckets owned by the requester.
    property buckets : Array(Bucket) | Nil

    # The owner of the buckets listed.
    property owner : Owner | Nil

    # `ContinuationToken` is included in the response when there are more buckets that can be listed
    # with pagination. The next `ListBuckets` request to Amazon S3 can be continued with this
    # `ContinuationToken`. `ContinuationToken` is obfuscated and is not a real bucket.
    property continuation_token : String | Nil

    # If `Prefix` was sent with the request, it is included in the response.
    #
    # All bucket names in the response begin with the specified bucket name prefix.
    property prefix : String | Nil

    def initialize(
      @buckets : Array(Bucket) | Nil = nil,
      @owner : Owner | Nil = nil,
      @continuation_token : String | Nil = nil,
      @prefix : String | Nil = nil,
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
      xml.element("Buckets") do
        (@buckets || [] of Bucket).each do |item|
          xml.element("Bucket") { item.build_xml(xml) }
        end
      end

      if value = @owner
        xml.element("Owner") { value.build_xml(xml) }
      end

      if value = @continuation_token
        xml.element("ContinuationToken") { xml.text value }
      end

      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        buckets: node.xpath_nodes("*[local-name()='Buckets']/*[local-name()='Bucket']").map { |n| Bucket.from_xml(n) },
        owner: node.xpath_node("*[local-name()='Owner']").try { |n| Owner.from_xml(n) },
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
      )
    end

    def validate! : Nil
      if value = @buckets
        value.each(&.validate!)
      end

      if value = @owner
        value.validate!
      end
    end

    def_equals_and_hash(@buckets, @owner, @continuation_token, @prefix)
  end
end
