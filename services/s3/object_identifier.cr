private alias Core = Amazonite::Core

module Amazonite::S3
  # Object Identifier is unique value to identify objects.
  class ObjectIdentifier
    # Key name of the object.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property key : String

    # Version ID for the specific version of the object to delete.
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    # An entity tag (ETag) is an identifier assigned by a web server to a specific version of a
    # resource found at a URL. This header field makes the request method conditional on `ETags`.
    #
    # Entity tags (ETags) for S3 Express One Zone are random alphanumeric strings unique to the
    # object.
    property e_tag : String | Nil

    # If present, the objects are deleted only if its modification times matches the provided
    # `Timestamp`.
    #
    # This functionality is only supported for directory buckets.
    property last_modified_time : Time | Nil

    # If present, the objects are deleted only if its size matches the provided size in bytes.
    #
    # This functionality is only supported for directory buckets.
    property size : Int64 | Nil

    def initialize(
      @key : String,
      @version_id : String | Nil = nil,
      @e_tag : String | Nil = nil,
      @last_modified_time : Time | Nil = nil,
      @size : Int64 | Nil = nil,
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
      xml.element("Key") { xml.text @key }

      if value = @version_id
        xml.element("VersionId") { xml.text value }
      end

      if value = @e_tag
        xml.element("ETag") { xml.text value }
      end

      if value = @last_modified_time
        xml.element("LastModifiedTime") { xml.text Core::QueryValue.time(value) }
      end

      if value = @size
        xml.element("Size") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")).not_nil!,
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        e_tag: Core::XMLValue.string(node.xpath_node("*[local-name()='ETag']")),
        last_modified_time: Core::XMLValue.time(node.xpath_node("*[local-name()='LastModifiedTime']")),
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='Size']")),
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@key, @version_id, @e_tag, @last_modified_time, @size)
  end
end
