private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListObjectsV2Output
    # Set to `false` if all of the results were returned. Set to `true` if more keys are available to
    # return. If the number of results exceeds that specified by `MaxKeys`, all of the results might
    # not be returned.
    property is_truncated : Bool | Nil

    # Metadata about each object returned.
    property contents : Array(Object) | Nil

    # The bucket name.
    property name : String | Nil

    # Keys that begin with the indicated prefix.
    #
    # **Directory buckets** - For directory buckets, only prefixes that end in a delimiter (`/`) are
    # supported.
    property prefix : String | Nil

    # Causes keys that contain the same string between the `prefix` and the first occurrence of the
    # delimiter to be rolled up into a single result element in the `CommonPrefixes` collection. These
    # rolled-up keys are not returned elsewhere in the response. Each rolled-up result counts as only
    # one return against the `MaxKeys` value.
    #
    # **Directory buckets** - For directory buckets, `/` is the only supported delimiter.
    property delimiter : String | Nil

    # Sets the maximum number of keys returned in the response. By default, the action returns up to
    # 1,000 key names. The response might contain fewer keys but will never contain more.
    property max_keys : Int32 | Nil

    # All of the keys (up to 1,000) that share the same prefix are grouped together. When counting the
    # total numbers of returns by this API operation, this group of keys is considered as one item.
    #
    # A response can contain `CommonPrefixes` only if you specify a delimiter.
    #
    # `CommonPrefixes` contains all (if there are any) keys between `Prefix` and the next occurrence
    # of the string specified by a delimiter.
    #
    # `CommonPrefixes` lists keys that act like subdirectories in the directory specified by `Prefix`.
    #
    # For example, if the prefix is `notes/` and the delimiter is a slash (`/`) as in
    # `notes/summer/july`, the common prefix is `notes/summer/`. All of the keys that roll up into a
    # common prefix count as a single return when calculating the number of returns.
    #
    # - **Directory buckets** - For directory buckets, only prefixes that end in a delimiter (`/`) are
    # supported.
    #
    # - **Directory buckets ** - When you query `ListObjectsV2` with a delimiter during in-progress
    # multipart uploads, the `CommonPrefixes` response parameter contains the prefixes that are
    # associated with the in-progress multipart uploads. For more information about multipart uploads,
    # see [Multipart Upload
    # Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/mpuoverview.html) in the *Amazon S3
    # User Guide*.
    property common_prefixes : Array(CommonPrefix) | Nil

    # Encoding type used by Amazon S3 to encode object key names in the XML response.
    #
    # If you specify the `encoding-type` request parameter, Amazon S3 includes this element in the
    # response, and returns encoded key name values in the following response elements:
    #
    # `Delimiter, Prefix, Key,` and `StartAfter`.
    property encoding_type : EncodingType | Nil

    # `KeyCount` is the number of keys returned with this request. `KeyCount` will always be less than
    # or equal to the `MaxKeys` field. For example, if you ask for 50 keys, your result will include
    # 50 keys or fewer.
    property key_count : Int32 | Nil

    # If `ContinuationToken` was sent with the request, it is included in the response. You can use
    # the returned `ContinuationToken` for pagination of the list response.
    property continuation_token : String | Nil

    # `NextContinuationToken` is sent when `isTruncated` is true, which means there are more keys in
    # the bucket that can be listed. The next list requests to Amazon S3 can be continued with this
    # `NextContinuationToken`. `NextContinuationToken` is obfuscated and is not a real key
    property next_continuation_token : String | Nil

    # If StartAfter was sent with the request, it is included in the response.
    #
    # This functionality is not supported for directory buckets.
    property start_after : String | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @is_truncated : Bool | Nil = nil,
      @contents : Array(Object) | Nil = nil,
      @name : String | Nil = nil,
      @prefix : String | Nil = nil,
      @delimiter : String | Nil = nil,
      @max_keys : Int32 | Nil = nil,
      @common_prefixes : Array(CommonPrefix) | Nil = nil,
      @encoding_type : EncodingType | Nil = nil,
      @key_count : Int32 | Nil = nil,
      @continuation_token : String | Nil = nil,
      @next_continuation_token : String | Nil = nil,
      @start_after : String | Nil = nil,
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

      if value = @key_count
        xml.element("KeyCount") { xml.text value.to_s }
      end

      if value = @continuation_token
        xml.element("ContinuationToken") { xml.text value }
      end

      if value = @next_continuation_token
        xml.element("NextContinuationToken") { xml.text value }
      end

      if value = @start_after
        xml.element("StartAfter") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        contents: node.xpath_nodes("*[local-name()='Contents']").map { |n| Object.from_xml(n) },
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='Delimiter']")),
        max_keys: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxKeys']")),
        common_prefixes: node.xpath_nodes("*[local-name()='CommonPrefixes']").map { |n| CommonPrefix.from_xml(n) },
        encoding_type: (n = node.xpath_node("*[local-name()='EncodingType']")) ? AS::EncodingType.from_json_object_key?(n.content) : nil,
        key_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='KeyCount']")),
        continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ContinuationToken']")),
        next_continuation_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextContinuationToken']")),
        start_after: Core::XMLValue.string(node.xpath_node("*[local-name()='StartAfter']")),
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

    def_equals_and_hash(@is_truncated, @contents, @name, @prefix, @delimiter, @max_keys, @common_prefixes, @encoding_type, @key_count, @continuation_token, @next_continuation_token, @start_after, @request_charged)
  end
end
