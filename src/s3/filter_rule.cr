private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the Amazon S3 object key name to filter on. An object key name is the name assigned to
  # an object in your Amazon S3 bucket. You specify whether to filter on the suffix or prefix of the
  # object key name. A prefix is a specific string of characters at the beginning of an object key
  # name, which you can use to organize objects. For example, you can start the key names of related
  # objects with a prefix, such as `2023-` or `engineering/`. Then, you can use `FilterRule` to find
  # objects in a bucket with key names that have the same prefix. A suffix is similar to a prefix,
  # but it is at the end of the object key name instead of at the beginning.
  class FilterRule
    # The object key name prefix or suffix identifying one or more objects to which the filtering rule
    # applies. The maximum length is 1,024 characters. Overlapping prefixes and suffixes are not
    # supported. For more information, see [Configuring Event
    # Notifications](https://docs.aws.amazon.com/AmazonS3/latest/dev/NotificationHowTo.html) in the
    # *Amazon S3 User Guide*.
    property name : FilterRuleName | Nil

    # The value that the filter searches for in object key names.
    property value : String | Nil

    def initialize(
      @name : FilterRuleName | Nil = nil,
      @value : String | Nil = nil,
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
      if value = @name
        xml.element("Name") { xml.text value.to_json_object_key }
      end

      if value = @value
        xml.element("Value") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: (n = node.xpath_node("*[local-name()='Name']")) ? AS::FilterRuleName.from_json_object_key?(n.content) : nil,
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name, @value)
  end
end
