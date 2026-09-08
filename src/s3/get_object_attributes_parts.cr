private alias Core = Amazonite::Core

module Amazonite::S3
  # A collection of parts associated with a multipart upload.
  class GetObjectAttributesParts
    # The total number of parts.
    property total_parts_count : Int32 | Nil

    # The marker for the current part.
    property part_number_marker : String | Nil

    # When a list is truncated, this element specifies the last part in the list, as well as the value
    # to use for the `PartNumberMarker` request parameter in a subsequent request.
    property next_part_number_marker : String | Nil

    # The maximum number of parts allowed in the response.
    property max_parts : Int32 | Nil

    # Indicates whether the returned list of parts is truncated. A value of `true` indicates that the
    # list was truncated. A list can be truncated if the number of parts exceeds the limit returned in
    # the `MaxParts` element.
    property is_truncated : Bool | Nil

    # A container for elements related to a particular part. A response can contain zero or more
    # `Parts` elements.
    #
    # - **General purpose buckets** - For `GetObjectAttributes`, if an additional checksum (including
    # `x-amz-checksum-crc32`, `x-amz-checksum-crc32c`, `x-amz-checksum-sha1`, or
    # `x-amz-checksum-sha256`) isn't applied to the object specified in the request, the response
    # doesn't return the `Part` element.
    #
    # - **Directory buckets** - For `GetObjectAttributes`, regardless of whether an additional
    # checksum is applied to the object specified in the request, the response returns the `Part`
    # element.
    property parts : Array(ObjectPart) | Nil

    def initialize(
      @total_parts_count : Int32 | Nil = nil,
      @part_number_marker : String | Nil = nil,
      @next_part_number_marker : String | Nil = nil,
      @max_parts : Int32 | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @parts : Array(ObjectPart) | Nil = nil,
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
      if value = @total_parts_count
        xml.element("PartsCount") { xml.text value.to_s }
      end

      if value = @part_number_marker
        xml.element("PartNumberMarker") { xml.text value }
      end

      if value = @next_part_number_marker
        xml.element("NextPartNumberMarker") { xml.text value }
      end

      if value = @max_parts
        xml.element("MaxParts") { xml.text value.to_s }
      end

      if value = @is_truncated
        xml.element("IsTruncated") { xml.text Core::QueryValue.bool(value) }
      end

      (@parts || [] of ObjectPart).each do |item|
        xml.element("Part") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        total_parts_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PartsCount']")),
        part_number_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='PartNumberMarker']")),
        next_part_number_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='NextPartNumberMarker']")),
        max_parts: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxParts']")),
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        parts: node.xpath_nodes("*[local-name()='Part']").map { |n| ObjectPart.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @parts
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@total_parts_count, @part_number_marker, @next_part_number_marker, @max_parts, @is_truncated, @parts)
  end
end
