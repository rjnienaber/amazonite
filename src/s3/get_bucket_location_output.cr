private alias AS = Amazonite::S3

module Amazonite::S3
  class GetBucketLocationOutput
    # Specifies the Region where the bucket resides. For a list of all the Amazon S3 supported
    # location constraints by Region, see [Regions and
    # Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region).
    #
    # Buckets in Region `us-east-1` have a LocationConstraint of `null`. Buckets with a
    # LocationConstraint of `EU` reside in `eu-west-1`.
    property location_constraint : BucketLocationConstraint | Nil

    def initialize(
      @location_constraint : BucketLocationConstraint | Nil = nil,
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
      if value = @location_constraint
        xml.element("LocationConstraint") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        location_constraint: (n = node.xpath_node("*[local-name()='LocationConstraint']")) ? AS::BucketLocationConstraint.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@location_constraint)
  end
end
