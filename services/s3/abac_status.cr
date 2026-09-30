private alias AS = Amazonite::S3

module Amazonite::S3
  # The ABAC status of the general purpose bucket. When ABAC is enabled for the general purpose
  # bucket, you can use tags to manage access to the general purpose buckets as well as for cost
  # tracking purposes. When ABAC is disabled for the general purpose buckets, you can only use tags
  # for cost tracking purposes. For more information, see [Using tags with S3 general purpose
  # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging.html).
  class AbacStatus
    # The ABAC status of the general purpose bucket.
    property status : BucketAbacStatus | Nil

    def initialize(
      @status : BucketAbacStatus | Nil = nil,
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
      if value = @status
        xml.element("Status") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AS::BucketAbacStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
