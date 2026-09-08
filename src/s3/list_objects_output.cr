private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListObjectsOutput
    # A flag that indicates whether Amazon S3 returned all of the results that satisfied the search
    # criteria.
    property is_truncated : Bool | Nil

    # Indicates where in the bucket listing begins. Marker is included in the response if it was sent
    # with the request.
    property marker : String | Nil

    # When the response is truncated (the `IsTruncated` element value in the response is `true`), you
    # can use the key name in this field as the `marker` parameter in the subsequent request to get
    # the next set of objects. Amazon S3 lists objects in alphabetical order.
    #
    # This element is returned only if you have the `delimiter` request parameter specified. If the
    # response does not include the `NextMarker` element and it is truncated, you can use the value of
    # the last `Key` element in the response as the `marker` parameter in the subsequent request to
    # get the next set of object keys.
    property next_marker : String | Nil

    # Metadata about each object returned.
    property contents : Array(Object) | Nil

    # The bucket name.
    property name : String | Nil

    # Keys that begin with the indicated prefix.
    property prefix : String | Nil

    # Causes keys that contain the same string between the prefix and the first occurrence of the
    # delimiter to be rolled up into a single result element in the `CommonPrefixes` collection. These
    # rolled-up keys are not returned elsewhere in the response. Each rolled-up result counts as only
    # one return against the `MaxKeys` value.
    property delimiter : String | Nil

    # The maximum number of keys returned in the response body.
    property max_keys : Int32 | Nil

    # All of the keys (up to 1,000) rolled up in a common prefix count as a single return when
    # calculating the number of returns.
    #
    # A response can contain `CommonPrefixes` only if you specify a delimiter.
    #
    # `CommonPrefixes` contains all (if there are any) keys between `Prefix` and the next occurrence
    # of the string specified by the delimiter.
    #
    # `CommonPrefixes` lists keys that act like subdirectories in the directory specified by `Prefix`.
    #
    # For example, if the prefix is `notes/` and the delimiter is a slash (`/`), as in
    # `notes/summer/july`, the common prefix is `notes/summer/`. All of the keys that roll up into a
    # common prefix count as a single return when calculating the number of returns.
    property common_prefixes : Array(CommonPrefix) | Nil

    # Encoding type used by Amazon S3 to encode the [object
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html) in the response.
    # Responses are encoded only in UTF-8. An object key can contain any Unicode character. However,
    # the XML 1.0 parser can't parse certain characters, such as characters with an ASCII value from 0
    # to 10. For characters that aren't supported in XML 1.0, you can add this parameter to request
    # that Amazon S3 encode the keys in the response. For more information about characters to avoid
    # in object key names, see [Object key naming
    # guidelines](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-guidelines).
    #
    # When using the URL encoding type, non-ASCII characters that are used in an object's key name
    # will be percent-encoded according to UTF-8 code values. For example, the object
    # `test_file(3).png` will appear as `test_file%283%29.png`.
    property encoding_type : EncodingType | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @is_truncated : Bool | Nil = nil,
      @marker : String | Nil = nil,
      @next_marker : String | Nil = nil,
      @contents : Array(Object) | Nil = nil,
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

      if value = @marker
        xml.element("Marker") { xml.text value }
      end

      if value = @next_marker
        xml.element("NextMarker") { xml.text value }
      end

      (@contents || [] of Object).each do |item|
        xml.element("Contents") { item.build_xml(xml) }
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
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        next_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='NextMarker']")),
        contents: node.xpath_nodes("*[local-name()='Contents']").map { |n| Object.from_xml(n) },
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='Delimiter']")),
        max_keys: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxKeys']")),
        common_prefixes: node.xpath_nodes("*[local-name()='CommonPrefixes']").map { |n| CommonPrefix.from_xml(n) },
        encoding_type: (n = node.xpath_node("*[local-name()='EncodingType']")) ? AS::EncodingType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @contents
        value.each(&.validate!)
      end

      if value = @common_prefixes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@is_truncated, @marker, @next_marker, @contents, @name, @prefix, @delimiter, @max_keys, @common_prefixes, @encoding_type, @request_charged)
  end
end
