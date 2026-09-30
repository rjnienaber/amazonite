private alias AS = Amazonite::S3

module Amazonite::S3
  # Container for S3 Glacier job parameters.
  class GlacierJobParameters
    # Retrieval tier at which the restore will be processed.
    property tier : Tier

    def initialize(
      @tier : Tier,
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
      xml.element("Tier") { xml.text @tier.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tier: ((n = node.xpath_node("*[local-name()='Tier']")) ? AS::Tier.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@tier)
  end
end
