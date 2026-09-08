private alias Core = Amazonite::Core

module Amazonite::S3
  # The container element for a bucket's policy status.
  class PolicyStatus
    # The policy status for this bucket. `TRUE` indicates that this bucket is public. `FALSE`
    # indicates that the bucket is not public.
    property is_public : Bool | Nil

    def initialize(
      @is_public : Bool | Nil = nil,
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
      if value = @is_public
        xml.element("IsPublic") { xml.text Core::QueryValue.bool(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_public: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsPublic']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@is_public)
  end
end
