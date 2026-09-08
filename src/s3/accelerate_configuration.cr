private alias AS = Amazonite::S3

module Amazonite::S3
  # Configures the transfer acceleration state for an Amazon S3 bucket. For more information, see
  # [Amazon S3 Transfer
  # Acceleration](https://docs.aws.amazon.com/AmazonS3/latest/dev/transfer-acceleration.html) in the
  # *Amazon S3 User Guide*.
  class AccelerateConfiguration
    # Specifies the transfer acceleration status of the bucket.
    property status : BucketAccelerateStatus | Nil

    def initialize(
      @status : BucketAccelerateStatus | Nil = nil,
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
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AS::BucketAccelerateStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
