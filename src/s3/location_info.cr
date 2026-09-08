private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the location where the bucket will be created.
  #
  # For directory buckets, the location type is Availability Zone or Local Zone. For more
  # information about directory buckets, see [Working with directory
  # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-overview.html)
  # in the *Amazon S3 User Guide*.
  #
  # This functionality is only supported by directory buckets.
  class LocationInfo
    # The type of location where the bucket will be created.
    property type : LocationType | Nil

    # The name of the location where the bucket will be created.
    #
    # For directory buckets, the name of the location is the Zone ID of the Availability Zone (AZ) or
    # Local Zone (LZ) where the bucket will be created. An example AZ ID value is `usw2-az1`.
    property name : String | Nil

    def initialize(
      @type : LocationType | Nil = nil,
      @name : String | Nil = nil,
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
      if value = @type
        xml.element("Type") { xml.text value.to_json_object_key }
      end

      if value = @name
        xml.element("Name") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        type: (n = node.xpath_node("*[local-name()='Type']")) ? AS::LocationType.from_json_object_key?(n.content) : nil,
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@type, @name)
  end
end
