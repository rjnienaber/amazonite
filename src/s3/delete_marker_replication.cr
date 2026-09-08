private alias AS = Amazonite::S3

module Amazonite::S3
  # Specifies whether Amazon S3 replicates delete markers. If you specify a `Filter` in your
  # replication configuration, you must also include a `DeleteMarkerReplication` element. If your
  # `Filter` includes a `Tag` element, the `DeleteMarkerReplication` `Status` must be set to
  # Disabled, because Amazon S3 does not support replicating delete markers for tag-based rules. For
  # an example configuration, see [Basic Rule
  # Configuration](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-config-min-rule-config).
  #
  # For more information about delete marker replication, see [Basic Rule
  # Configuration](https://docs.aws.amazon.com/AmazonS3/latest/dev/delete-marker-replication.html).
  #
  # If you are using an earlier version of the replication configuration, Amazon S3 handles
  # replication of delete markers differently. For more information, see [Backward
  # Compatibility](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-add-config.html#replication-backward-compat-considerations).
  class DeleteMarkerReplication
    # Indicates whether to replicate delete markers.
    #
    # Indicates whether to replicate delete markers.
    property status : DeleteMarkerReplicationStatus | Nil

    def initialize(
      @status : DeleteMarkerReplicationStatus | Nil = nil,
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
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AS::DeleteMarkerReplicationStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
