private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListMultipartUploadsOutput
    # The name of the bucket to which the multipart upload was initiated. Does not return the access
    # point ARN or access point alias if used.
    property bucket : String | Nil

    # The key at or after which the listing began.
    property key_marker : String | Nil

    # Together with key-marker, specifies the multipart upload after which listing should begin. If
    # key-marker is not specified, the upload-id-marker parameter is ignored. Otherwise, any multipart
    # uploads for a key equal to the key-marker might be included in the list only if they have an
    # upload ID lexicographically greater than the specified `upload-id-marker`.
    #
    # This functionality is not supported for directory buckets.
    property upload_id_marker : String | Nil

    # When a list is truncated, this element specifies the value that should be used for the
    # key-marker request parameter in a subsequent request.
    property next_key_marker : String | Nil

    # When a prefix is provided in the request, this field contains the specified prefix. The result
    # contains only keys starting with the specified prefix.
    #
    # **Directory buckets** - For directory buckets, only prefixes that end in a delimiter (`/`) are
    # supported.
    property prefix : String | Nil

    # Contains the delimiter you specified in the request. If you don't specify a delimiter in your
    # request, this element is absent from the response.
    #
    # **Directory buckets** - For directory buckets, `/` is the only supported delimiter.
    property delimiter : String | Nil

    # When a list is truncated, this element specifies the value that should be used for the
    # `upload-id-marker` request parameter in a subsequent request.
    #
    # This functionality is not supported for directory buckets.
    property next_upload_id_marker : String | Nil

    # Maximum number of multipart uploads that could have been included in the response.
    property max_uploads : Int32 | Nil

    # Indicates whether the returned list of multipart uploads is truncated. A value of true indicates
    # that the list was truncated. The list can be truncated if the number of multipart uploads
    # exceeds the limit allowed or specified by max uploads.
    property is_truncated : Bool | Nil

    # Container for elements related to a particular multipart upload. A response can contain zero or
    # more `Upload` elements.
    property uploads : Array(MultipartUpload) | Nil

    # If you specify a delimiter in the request, then the result returns each distinct key prefix
    # containing the delimiter in a `CommonPrefixes` element. The distinct key prefixes are returned
    # in the `Prefix` child element.
    #
    # **Directory buckets** - For directory buckets, only prefixes that end in a delimiter (`/`) are
    # supported.
    property common_prefixes : Array(CommonPrefix) | Nil

    # Encoding type used by Amazon S3 to encode object keys in the response.
    #
    # If you specify the `encoding-type` request parameter, Amazon S3 includes this element in the
    # response, and returns encoded key name values in the following response elements:
    #
    # `Delimiter`, `KeyMarker`, `Prefix`, `NextKeyMarker`, `Key`.
    property encoding_type : EncodingType | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @bucket : String | Nil = nil,
      @key_marker : String | Nil = nil,
      @upload_id_marker : String | Nil = nil,
      @next_key_marker : String | Nil = nil,
      @prefix : String | Nil = nil,
      @delimiter : String | Nil = nil,
      @next_upload_id_marker : String | Nil = nil,
      @max_uploads : Int32 | Nil = nil,
      @is_truncated : Bool | Nil = nil,
      @uploads : Array(MultipartUpload) | Nil = nil,
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
      if value = @bucket
        xml.element("Bucket") { xml.text value }
      end

      if value = @key_marker
        xml.element("KeyMarker") { xml.text value }
      end

      if value = @upload_id_marker
        xml.element("UploadIdMarker") { xml.text value }
      end

      if value = @next_key_marker
        xml.element("NextKeyMarker") { xml.text value }
      end

      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end

      if value = @delimiter
        xml.element("Delimiter") { xml.text value }
      end

      if value = @next_upload_id_marker
        xml.element("NextUploadIdMarker") { xml.text value }
      end

      if value = @max_uploads
        xml.element("MaxUploads") { xml.text value.to_s }
      end

      if value = @is_truncated
        xml.element("IsTruncated") { xml.text Core::QueryValue.bool(value) }
      end

      (@uploads || [] of MultipartUpload).each do |item|
        xml.element("Upload") { item.build_xml(xml) }
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
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")),
        key_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyMarker']")),
        upload_id_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='UploadIdMarker']")),
        next_key_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='NextKeyMarker']")),
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='Delimiter']")),
        next_upload_id_marker: Core::XMLValue.string(node.xpath_node("*[local-name()='NextUploadIdMarker']")),
        max_uploads: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxUploads']")),
        is_truncated: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsTruncated']")),
        uploads: node.xpath_nodes("*[local-name()='Upload']").map { |n| MultipartUpload.from_xml(n) },
        common_prefixes: node.xpath_nodes("*[local-name()='CommonPrefixes']").map { |n| CommonPrefix.from_xml(n) },
        encoding_type: (n = node.xpath_node("*[local-name()='EncodingType']")) ? AS::EncodingType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @uploads
        value.each(&.validate!)
      end

      if value = @common_prefixes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@bucket, @key_marker, @upload_id_marker, @next_key_marker, @prefix, @delimiter, @next_upload_id_marker, @max_uploads, @is_truncated, @uploads, @common_prefixes, @encoding_type, @request_charged)
  end
end
