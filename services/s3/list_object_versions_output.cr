private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListObjectVersionsOutput
    # A flag that indicates whether Amazon S3 returned all of the results that satisfied the search
    # criteria. If your results were truncated, you can make a follow-up paginated request by using
    # the `NextKeyMarker` and `NextVersionIdMarker` response parameters as a starting place in another
    # request to return the rest of the results.
    property is_truncated : Bool | Nil

    # Marks the last key returned in a truncated response.
    property key_marker : String | Nil

    # Marks the last version of the key returned in a truncated response.
    property version_id_marker : String | Nil

    # When the number of responses exceeds the value of `MaxKeys`, `NextKeyMarker` specifies the first
    # key not returned that satisfies the search criteria. Use this value for the key-marker request
    # parameter in a subsequent request.
    property next_key_marker : String | Nil

    # When the number of responses exceeds the value of `MaxKeys`, `NextVersionIdMarker` specifies the
    # first object version not returned that satisfies the search criteria. Use this value for the
    # `version-id-marker` request parameter in a subsequent request.
    property next_version_id_marker : String | Nil

    # Container for version information.
    property versions : Array(ObjectVersion) | Nil

    # Container for an object that is a delete marker. To learn more about delete markers, see
    # [Working with delete
    # markers](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html).
    property delete_markers : Array(DeleteMarkerEntry) | Nil

    # The bucket name.
    property name : String | Nil

    # Selects objects that start with the value supplied by this parameter.
    property prefix : String | Nil

    # The delimiter grouping the included keys. A delimiter is a character that you specify to group
    # keys. All keys that contain the same string between the prefix and the first occurrence of the
    # delimiter are grouped under a single result element in `CommonPrefixes`. These groups are
    # counted as one result against the `max-keys` limitation. These keys are not returned elsewhere
    # in the response.
    property delimiter : String | Nil

    # Specifies the maximum number of objects to return.
    property max_keys : Int32 | Nil

    # All of the keys rolled up into a common prefix count as a single return when calculating the
    # number of returns.
    property common_prefixes : Array(CommonPrefix) | Nil

    # Encoding type used by Amazon S3 to encode object key names in the XML response.
    #
    # If you specify the `encoding-type` request parameter, Amazon S3 includes this element in the
    # response, and returns encoded key name values in the following response elements:
    #
    # `KeyMarker, NextKeyMarker, Prefix, Key`, and `Delimiter`.
    property encoding_type : EncodingType | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @is_truncated : Bool | Nil = nil,
      @key_marker : String | Nil = nil,
      @version_id_marker : String | Nil = nil,
      @next_key_marker : String | Nil = nil,
      @next_version_id_marker : String | Nil = nil,
      @versions : Array(ObjectVersion) | Nil = nil,
      @delete_markers : Array(DeleteMarkerEntry) | Nil = nil,
      @name : String | Nil = nil,
      @prefix : String | Nil = nil,
      @delimiter : String | Nil = nil,
      @max_keys : Int32 | Nil = nil,
      @common_prefixes : Array(CommonPrefix) | Nil = nil,
      @encoding_type : EncodingType | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
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
      if value = @is_truncated
        xml.element("IsTruncated") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @key_marker
        xml.element("KeyMarker") { xml.text value }
      end

      if value = @version_id_marker
        xml.element("VersionIdMarker") { xml.text value }
      end

      if value = @next_key_marker
        xml.element("NextKeyMarker") { xml.text value }
      end

      if value = @next_version_id_marker
        xml.element("NextVersionIdMarker") { xml.text value }
      end

      (@versions || [] of ObjectVersion).each do |item|
        xml.element("Version") { item.build_xml(xml) }
      end

      (@delete_markers || [] of DeleteMarkerEntry).each do |item|
        xml.element("DeleteMarker") { item.build_xml(xml) }
      end

      if value = @name
        xml.element("Name") { xml.text value }
      end

      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end

      if value = @delimiter
        xml.element("Delimiter") { xml.text value }
      end

      if value = @max_keys
        xml.element("MaxKeys") { xml.text value.to_s }
      end

      (@common_prefixes || [] of CommonPrefix).each do |item|
        xml.element("CommonPrefixes") { item.build_xml(xml) }
      end

      if value = @encoding_type
        xml.element("EncodingType") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        key_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyMarker']")),
        version_id_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionIdMarker']")),
        next_key_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='NextKeyMarker']")),
        next_version_id_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='NextVersionIdMarker']")),
        versions: node.xpath_nodes("*[local-name()='Version']").map { |n| ObjectVersion.from_xml(n) },
        delete_markers: node.xpath_nodes("*[local-name()='DeleteMarker']").map { |n| DeleteMarkerEntry.from_xml(n) },
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='Delimiter']")),
        max_keys: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxKeys']")),
        common_prefixes: node.xpath_nodes("*[local-name()='CommonPrefixes']").map { |n| CommonPrefix.from_xml(n) },
        encoding_type: (n = node.xpath_node("*[local-name()='EncodingType']")) ? AS::EncodingType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @versions
        value.each(&.validate!)
      end

      if value = @delete_markers
        value.each(&.validate!)
      end

      if value = @common_prefixes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@is_truncated, @key_marker, @version_id_marker, @next_key_marker, @next_version_id_marker, @versions, @delete_markers, @name, @prefix, @delimiter, @max_keys, @common_prefixes, @encoding_type, @request_charged)
  end
end
