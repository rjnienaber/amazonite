private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class ListObjectVersionsRequest
    # The bucket name that contains the objects.
    property bucket : String = ""

    # A delimiter is a character that you specify to group keys. All keys that contain the same string
    # between the `prefix` and the first occurrence of the delimiter are grouped under a single result
    # element in `CommonPrefixes`. These groups are counted as one result against the `max-keys`
    # limitation. These keys are not returned elsewhere in the response.
    #
    # `CommonPrefixes` is filtered out from results if it is not lexicographically greater than the
    # key-marker.
    property delimiter : String | Nil

    property encoding_type : EncodingType | Nil

    # Specifies the key to start with when listing objects in a bucket.
    property key_marker : String | Nil

    # Sets the maximum number of keys returned in the response. By default, the action returns up to
    # 1,000 key names. The response might contain fewer keys but will never contain more. If
    # additional keys satisfy the search criteria, but were not returned because `max-keys` was
    # exceeded, the response contains `true`. To return the additional keys, see `key-marker` and
    # `version-id-marker`.
    property max_keys : Int32 | Nil

    # Use this parameter to select only those keys that begin with the specified prefix. You can use
    # prefixes to separate a bucket into different groupings of keys. (You can think of using `prefix`
    # to make groups in the same way that you'd use a folder in a file system.) You can use `prefix`
    # with `delimiter` to roll up numerous objects into a single result under `CommonPrefixes`.
    property prefix : String | Nil

    # Specifies the object version you want to start listing from.
    property version_id_marker : String | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    property request_payer : RequestPayer | Nil

    # Specifies the optional fields that you want returned in the response. Fields that you do not
    # specify are not returned.
    property optional_object_attributes : Array(OptionalObjectAttributes) | Nil

    def initialize(
      @bucket : String,
      @delimiter : String | Nil = nil,
      @encoding_type : EncodingType | Nil = nil,
      @key_marker : String | Nil = nil,
      @max_keys : Int32 | Nil = nil,
      @prefix : String | Nil = nil,
      @version_id_marker : String | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @optional_object_attributes : Array(OptionalObjectAttributes) | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@bucket, @delimiter, @encoding_type, @key_marker, @max_keys, @prefix, @version_id_marker, @expected_bucket_owner, @request_payer, @optional_object_attributes)
  end
end
