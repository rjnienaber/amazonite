private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies information about where to publish analysis or configuration results for an Amazon S3
  # bucket and S3 Replication Time Control (S3 RTC).
  class Destination
    # The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the results.
    property bucket : String

    # Destination bucket owner account ID. In a cross-account scenario, if you direct Amazon S3 to
    # change replica ownership to the Amazon Web Services account that owns the destination bucket by
    # specifying the `AccessControlTranslation` property, this is the account ID of the destination
    # bucket owner. For more information, see [Replication Additional Configuration: Changing the
    # Replica Owner](https://docs.aws.amazon.com/AmazonS3/latest/dev/replication-change-owner.html) in
    # the *Amazon S3 User Guide*.
    property account : String | Nil

    # The storage class to use when replicating objects, such as S3 Standard or reduced redundancy. By
    # default, Amazon S3 uses the storage class of the source object to create the object replica.
    #
    # For valid values, see the `StorageClass` element of the [PUT Bucket
    # replication](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTreplication.html)
    # action in the *Amazon S3 API Reference*.
    #
    # `FSX_OPENZFS` is not an accepted value when replicating objects.
    property storage_class : StorageClass | Nil

    # Specify this only in a cross-account scenario (where source and destination bucket owners are
    # not the same), and you want to change replica ownership to the Amazon Web Services account that
    # owns the destination bucket. If this is not specified in the replication configuration, the
    # replicas are owned by same Amazon Web Services account that owns the source object.
    property access_control_translation : AccessControlTranslation | Nil

    # A container that provides information about encryption. If `SourceSelectionCriteria` is
    # specified, you must specify this element.
    property encryption_configuration : EncryptionConfiguration | Nil

    # A container specifying S3 Replication Time Control (S3 RTC), including whether S3 RTC is enabled
    # and the time when all objects and operations on objects must be replicated. Must be specified
    # together with a `Metrics` block.
    property replication_time : ReplicationTime | Nil

    # A container specifying replication metrics-related settings enabling replication metrics and
    # events.
    property metrics : Metrics | Nil

    def initialize(
      @bucket : String,
      @account : String | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
      @access_control_translation : AccessControlTranslation | Nil = nil,
      @encryption_configuration : EncryptionConfiguration | Nil = nil,
      @replication_time : ReplicationTime | Nil = nil,
      @metrics : Metrics | Nil = nil,
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
      xml.element("Bucket") { xml.text @bucket }

      if value = @account
        xml.element("Account") { xml.text value }
      end

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end

      if value = @access_control_translation
        xml.element("AccessControlTranslation") { value.build_xml(xml) }
      end

      if value = @encryption_configuration
        xml.element("EncryptionConfiguration") { value.build_xml(xml) }
      end

      if value = @replication_time
        xml.element("ReplicationTime") { value.build_xml(xml) }
      end

      if value = @metrics
        xml.element("Metrics") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")).not_nil!,
        account: Core::XMLValue.string(node.xpath_node("*[local-name()='Account']")),
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::StorageClass.from_json_object_key?(n.content) : nil,
        access_control_translation: node.xpath_node("*[local-name()='AccessControlTranslation']").try { |n| AccessControlTranslation.from_xml(n) },
        encryption_configuration: node.xpath_node("*[local-name()='EncryptionConfiguration']").try { |n| EncryptionConfiguration.from_xml(n) },
        replication_time: node.xpath_node("*[local-name()='ReplicationTime']").try { |n| ReplicationTime.from_xml(n) },
        metrics: node.xpath_node("*[local-name()='Metrics']").try { |n| Metrics.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @access_control_translation
        value.validate!
      end

      if value = @encryption_configuration
        value.validate!
      end

      if value = @replication_time
        value.validate!
      end

      if value = @metrics
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @account, @storage_class, @access_control_translation, @encryption_configuration, @replication_time, @metrics)
  end
end
