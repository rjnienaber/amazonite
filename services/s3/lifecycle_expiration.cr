private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for the expiration for the lifecycle of the object.
  #
  # For more information see, [Managing your storage
  # lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html) in
  # the *Amazon S3 User Guide*.
  class LifecycleExpiration
    # Indicates at what date the object is to be moved or deleted. The date value must conform to the
    # ISO 8601 format. The time is always midnight UTC.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property date : Time | Nil

    # Indicates the lifetime, in days, of the objects that are subject to the rule. The value must be
    # a non-zero positive integer.
    property days : Int32 | Nil

    # Indicates whether Amazon S3 will remove a delete marker with no noncurrent versions. If set to
    # true, the delete marker will be expired; if set to false the policy takes no action. This cannot
    # be specified with Days or Date in a Lifecycle Expiration Policy.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property expired_object_delete_marker : Bool | Nil

    def initialize(
      @date : Time | Nil = nil,
      @days : Int32 | Nil = nil,
      @expired_object_delete_marker : Bool | Nil = nil,
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
      if value = @date
        xml.element("Date") { xml.text Core::QueryValue.time(value) }
      end

      if value = @days
        xml.element("Days") { xml.text value.to_s }
      end

      if value = @expired_object_delete_marker
        xml.element("ExpiredObjectDeleteMarker") { xml.text Core::QueryValue.bool(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        date: Core::XMLValue.time(node.xpath_node("*[local-name()='Date']")),
        days: Core::XMLValue.i32(node.xpath_node("*[local-name()='Days']")),
        expired_object_delete_marker: Core::XMLValue.bool(node.xpath_node("*[local-name()='ExpiredObjectDeleteMarker']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@date, @days, @expired_object_delete_marker)
  end
end
