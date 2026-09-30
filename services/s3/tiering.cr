private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically
  # moving data to the most cost-effective storage access tier, without additional operational
  # overhead.
  class Tiering
    # The number of consecutive days of no access after which an object will be eligible to be
    # transitioned to the corresponding tier. The minimum number of days specified for Archive Access
    # tier must be at least 90 days and Deep Archive Access tier must be at least 180 days. The
    # maximum can be up to 2 years (730 days).
    property days : Int32

    # S3 Intelligent-Tiering access tier. See [Storage class for automatically optimizing frequently
    # and infrequently accessed
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html#sc-dynamic-data-access)
    # for a list of access tiers in the S3 Intelligent-Tiering storage class.
    property access_tier : IntelligentTieringAccessTier

    def initialize(
      @days : Int32,
      @access_tier : IntelligentTieringAccessTier,
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
      xml.element("Days") { xml.text @days.to_s }

      xml.element("AccessTier") { xml.text @access_tier.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        days: Core::XMLValue.i32(node.xpath_node("*[local-name()='Days']")).not_nil!,
        access_tier: ((n = node.xpath_node("*[local-name()='AccessTier']")) ? AS::IntelligentTieringAccessTier.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@days, @access_tier)
  end
end
