private alias AS = Amazonite::S3

module Amazonite::S3
  # A container for information about access control for replicas.
  class AccessControlTranslation
    # Specifies the replica ownership. For default and valid values, see [PUT bucket
    # replication](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html) in
    # the *Amazon S3 API Reference*.
    property owner : OwnerOverride

    def initialize(
      @owner : OwnerOverride,
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
      xml.element("Owner") { xml.text @owner.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner: ((n = node.xpath_node("*[local-name()='Owner']")) ? AS::OwnerOverride.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@owner)
  end
end
