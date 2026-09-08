private alias Core = Amazonite::Core

module Amazonite::S3
  # Information about the delete marker.
  class DeleteMarkerEntry
    # The account that created the delete marker.
    property owner : Owner | Nil

    # The object key.
    property key : String | Nil

    # Version ID of an object.
    property version_id : String | Nil

    # Specifies whether the object is (true) or is not (false) the latest version of an object.
    property is_latest : Bool | Nil

    # Date and time when the object was last modified.
    property last_modified : Time | Nil

    def initialize(
      @owner : Owner | Nil = nil,
      @key : String | Nil = nil,
      @version_id : String | Nil = nil,
      @is_latest : Bool | Nil = nil,
      @last_modified : Time | Nil = nil,
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
      if value = @owner
        xml.element("Owner") { value.build_xml(xml) }
      end

      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @version_id
        xml.element("VersionId") { xml.text value }
      end

      if value = @is_latest
        xml.element("IsLatest") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @last_modified
        xml.element("LastModified") { xml.text Core::QueryValue.time(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        owner: node.xpath_node("*[local-name()='Owner']").try { |n| Owner.from_xml(n) },
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        is_latest: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsLatest']")),
        last_modified: Core::XMLValue.time(node.xpath_node("*[local-name()='LastModified']")),
      )
    end

    def validate! : Nil
      if value = @owner
        value.validate!
      end

      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@owner, @key, @version_id, @is_latest, @last_modified)
  end
end
