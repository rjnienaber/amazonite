private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies which Amazon S3 objects to replicate and where to store the replicas.
  class ReplicationRule
    # A unique identifier for the rule. The maximum value is 255 characters.
    property id : String | Nil

    # The priority indicates which rule has precedence whenever two or more replication rules
    # conflict. Amazon S3 will attempt to replicate objects according to all replication rules.
    # However, if there are two or more rules with the same destination bucket, then objects will be
    # replicated according to the rule with the highest priority. The higher the number, the higher
    # the priority.
    #
    # For more information, see
    # [Replication](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication.html) in the *Amazon
    # S3 User Guide*.
    property priority : Int32 | Nil

    # An object key name prefix that identifies the object or objects to which the rule applies. The
    # maximum prefix length is 1,024 characters. To include all objects in a bucket, specify an empty
    # string.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property prefix : String | Nil

    property filter : ReplicationRuleFilter | Nil

    # Specifies whether the rule is enabled.
    property status : ReplicationRuleStatus

    # A container that describes additional filters for identifying the source objects that you want
    # to replicate. You can choose to enable or disable the replication of these objects. Currently,
    # Amazon S3 supports only the filter that you can specify for objects created with server-side
    # encryption using a customer managed key stored in Amazon Web Services Key Management Service
    # (SSE-KMS).
    property source_selection_criteria : SourceSelectionCriteria | Nil

    # Optional configuration to replicate existing source bucket objects.
    #
    # This parameter is no longer supported. To replicate existing objects, see [Replicating existing
    # objects with S3 Batch
    # Replication](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-batch-replication-batch.html)
    # in the *Amazon S3 User Guide*.
    property existing_object_replication : ExistingObjectReplication | Nil

    # A container for information about the replication destination and its configurations including
    # enabling the S3 Replication Time Control (S3 RTC).
    property destination : Destination

    property delete_marker_replication : DeleteMarkerReplication | Nil

    def initialize(
      @status : ReplicationRuleStatus,
      @destination : Destination,
      @id : String | Nil = nil,
      @priority : Int32 | Nil = nil,
      @prefix : String | Nil = nil,
      @filter : ReplicationRuleFilter | Nil = nil,
      @source_selection_criteria : SourceSelectionCriteria | Nil = nil,
      @existing_object_replication : ExistingObjectReplication | Nil = nil,
      @delete_marker_replication : DeleteMarkerReplication | Nil = nil,
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
      if value = @id
        xml.element("ID") { xml.text value }
      end

      if value = @priority
        xml.element("Priority") { xml.text value.to_s }
      end

      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end

      if value = @filter
        xml.element("Filter") { value.build_xml(xml) }
      end

      xml.element("Status") { xml.text @status.to_json_object_key }

      if value = @source_selection_criteria
        xml.element("SourceSelectionCriteria") { value.build_xml(xml) }
      end

      if value = @existing_object_replication
        xml.element("ExistingObjectReplication") { value.build_xml(xml) }
      end

      xml.element("Destination") { @destination.build_xml(xml) }

      if value = @delete_marker_replication
        xml.element("DeleteMarkerReplication") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='ID']")),
        priority: Core::XMLValue.i32(node.xpath_node("*[local-name()='Priority']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| ReplicationRuleFilter.from_xml(n) },
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::ReplicationRuleStatus.from_json_object_key?(n.content) : nil).not_nil!,
        source_selection_criteria: node.xpath_node("*[local-name()='SourceSelectionCriteria']").try { |n| SourceSelectionCriteria.from_xml(n) },
        existing_object_replication: node.xpath_node("*[local-name()='ExistingObjectReplication']").try { |n| ExistingObjectReplication.from_xml(n) },
        destination: node.xpath_node("*[local-name()='Destination']").try { |n| Destination.from_xml(n) }.not_nil!,
        delete_marker_replication: node.xpath_node("*[local-name()='DeleteMarkerReplication']").try { |n| DeleteMarkerReplication.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filter
        value.validate!
      end

      if value = @source_selection_criteria
        value.validate!
      end

      if value = @existing_object_replication
        value.validate!
      end

      if value = @destination
        value.validate!
      end

      if value = @delete_marker_replication
        value.validate!
      end
    end

    def_equals_and_hash(@id, @priority, @prefix, @filter, @status, @source_selection_criteria, @existing_object_replication, @destination, @delete_marker_replication)
  end
end
