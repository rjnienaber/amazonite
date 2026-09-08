private alias Core = Amazonite::Core

module Amazonite::S3
  class ListDirectoryBucketsOutput
    # The list of buckets owned by the requester.
    property buckets : Array(Bucket) | Nil

    # If `ContinuationToken` was sent with the request, it is included in the response. You can use
    # the returned `ContinuationToken` for pagination of the list response.
    property continuation_token : String | Nil

    def initialize(
      @buckets : Array(Bucket) | Nil = nil,
      @continuation_token : String | Nil = nil,
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

      if value = @continuation_token
        xml.element("ContinuationToken") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        buckets: node.xpath_nodes("*[local-name()='Buckets']/*[local-name()='Bucket']").map { |n| Bucket.from_xml(n) },
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
      )
    end

    def validate! : Nil
      if value = @buckets
        value.each(&.validate!)
      end

      if value = @continuation_token
        raise Core::ValidationError.new("ContinuationToken length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ContinuationToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@buckets, @continuation_token)
  end
end
