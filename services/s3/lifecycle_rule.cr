private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # A lifecycle rule for individual objects in an Amazon S3 bucket.
  #
  # For more information see, [Managing your storage
  # lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html) in
  # the *Amazon S3 User Guide*.
  class LifecycleRule
    # Specifies the expiration for the lifecycle of the object in the form of date, days and, whether
    # the object has a delete marker.
    property expiration : LifecycleExpiration | Nil

    # Unique identifier for the rule. The value cannot be longer than 255 characters.
    property id : String | Nil

    # The general purpose bucket prefix that identifies one or more objects to which the rule applies.
    # We recommend using `Filter` instead of `Prefix` for new PUTs. Previous configurations where a
    # prefix is defined will continue to operate as before.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property prefix : String | Nil

    # The `Filter` is used to identify objects that a Lifecycle Rule applies to. A `Filter` must have
    # exactly one of `Prefix`, `Tag`, `ObjectSizeGreaterThan`, `ObjectSizeLessThan`, or `And`
    # specified. `Filter` is required if the `LifecycleRule` does not contain a `Prefix` element.
    #
    # For more information about `Tag` filters, see [Adding filters to Lifecycle
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/intro-lifecycle-filters.html) in
    # the *Amazon S3 User Guide*.
    #
    # `Tag` filters are not supported for directory buckets.
    property filter : LifecycleRuleFilter | Nil

    # If 'Enabled', the rule is currently being applied. If 'Disabled', the rule is not currently
    # being applied.
    property status : ExpirationStatus

    # Specifies when an Amazon S3 object transitions to a specified storage class.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property transitions : Array(Transition) | Nil

    # Specifies the transition rule for the lifecycle rule that describes when noncurrent objects
    # transition to a specific storage class. If your bucket is versioning-enabled (or versioning is
    # suspended), you can set this action to request that Amazon S3 transition noncurrent object
    # versions to a specific storage class at a set period in the object's lifetime.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property noncurrent_version_transitions : Array(NoncurrentVersionTransition) | Nil

    property noncurrent_version_expiration : NoncurrentVersionExpiration | Nil

    property abort_incomplete_multipart_upload : AbortIncompleteMultipartUpload | Nil

    def initialize(
      @status : ExpirationStatus,
      @expiration : LifecycleExpiration | Nil = nil,
      @id : String | Nil = nil,
      @prefix : String | Nil = nil,
      @filter : LifecycleRuleFilter | Nil = nil,
      @transitions : Array(Transition) | Nil = nil,
      @noncurrent_version_transitions : Array(NoncurrentVersionTransition) | Nil = nil,
      @noncurrent_version_expiration : NoncurrentVersionExpiration | Nil = nil,
      @abort_incomplete_multipart_upload : AbortIncompleteMultipartUpload | Nil = nil,
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
      if value = @expiration
        xml.element("Expiration") { value.build_xml(xml) }
      end

      if value = @id
        xml.element("ID") { xml.text value }
      end

      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end

      if value = @filter
        xml.element("Filter") { value.build_xml(xml) }
      end

      xml.element("Status") { xml.text @status.to_json_object_key }

      (@transitions || [] of Transition).each do |item|
        xml.element("Transition") { item.build_xml(xml) }
      end

      (@noncurrent_version_transitions || [] of NoncurrentVersionTransition).each do |item|
        xml.element("NoncurrentVersionTransition") { item.build_xml(xml) }
      end

      if value = @noncurrent_version_expiration
        xml.element("NoncurrentVersionExpiration") { value.build_xml(xml) }
      end

      if value = @abort_incomplete_multipart_upload
        xml.element("AbortIncompleteMultipartUpload") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        expiration: node.xpath_node("*[local-name()='Expiration']").try { |n| LifecycleExpiration.from_xml(n) },
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='ID']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| LifecycleRuleFilter.from_xml(n) },
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::ExpirationStatus.from_json_object_key?(n.content) : nil).not_nil!,
        transitions: node.xpath_nodes("*[local-name()='Transition']").map { |n| Transition.from_xml(n) },
        noncurrent_version_transitions: node.xpath_nodes("*[local-name()='NoncurrentVersionTransition']").map { |n| NoncurrentVersionTransition.from_xml(n) },
        noncurrent_version_expiration: node.xpath_node("*[local-name()='NoncurrentVersionExpiration']").try { |n| NoncurrentVersionExpiration.from_xml(n) },
        abort_incomplete_multipart_upload: node.xpath_node("*[local-name()='AbortIncompleteMultipartUpload']").try { |n| AbortIncompleteMultipartUpload.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @expiration
        value.validate!
      end

      if value = @filter
        value.validate!
      end

      if value = @transitions
        value.each(&.validate!)
      end

      if value = @noncurrent_version_transitions
        value.each(&.validate!)
      end

      if value = @noncurrent_version_expiration
        value.validate!
      end

      if value = @abort_incomplete_multipart_upload
        value.validate!
      end
    end

    def_equals_and_hash(@expiration, @id, @prefix, @filter, @status, @transitions, @noncurrent_version_transitions, @noncurrent_version_expiration, @abort_incomplete_multipart_upload)
  end
end
