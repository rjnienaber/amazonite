private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies when an object transitions to a specified storage class. For more information about
  # Amazon S3 lifecycle configuration rules, see [Transitioning Objects Using Amazon S3
  # Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/dev/lifecycle-transition-general-considerations.html)
  # in the *Amazon S3 User Guide*.
  class Transition
    # Indicates when objects are transitioned to the specified storage class. The date value must be
    # in ISO 8601 format. The time is always midnight UTC.
    property date : Time | Nil

    # Indicates the number of days after creation when objects are transitioned to the specified
    # storage class. The value can be `0` or any positive integer. Be aware that some storage classes
    # have a minimum storage duration and that you're charged for transitioning objects before their
    # minimum storage duration. For more information, see [ Constraints and considerations for
    # transitions](https://docs.aws.amazon.com/AmazonS3/latest/userguide/lifecycle-transition-general-considerations.html#lifecycle-configuration-constraints)
    # in the *Amazon S3 User Guide*.
    property days : Int32 | Nil

    # The storage class to which you want the object to transition.
    property storage_class : TransitionStorageClass | Nil

    def initialize(
      @date : Time | Nil = nil,
      @days : Int32 | Nil = nil,
      @storage_class : TransitionStorageClass | Nil = nil,
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

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        date: Core::XMLValue.time(node.xpath_node("*[local-name()='Date']")),
        days: Core::XMLValue.i32(node.xpath_node("*[local-name()='Days']")),
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::TransitionStorageClass.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@date, @days, @storage_class)
  end
end
