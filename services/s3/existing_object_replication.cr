private alias AS = Amazonite::S3

module Amazonite::S3
  # Optional configuration to replicate existing source bucket objects.
  #
  # This parameter is no longer supported. To replicate existing objects, see [Replicating existing
  # objects with S3 Batch
  # Replication](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-batch-replication-batch.html)
  # in the *Amazon S3 User Guide*.
  class ExistingObjectReplication
    # Specifies whether Amazon S3 replicates existing source bucket objects.
    property status : ExistingObjectReplicationStatus

    def initialize(
      @status : ExistingObjectReplicationStatus,
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
      xml.element("Status") { xml.text @status.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::ExistingObjectReplicationStatus.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
