module Amazonite::KmsV1
  class ListResourceTagsResponse
    include JSON::Serializable

    # A list of tags. Each tag consists of a tag key and a tag value.
    #
    # Tagging or untagging a KMS key can allow or deny permission to the KMS key. For details, see
    # [ABAC for KMS](https://docs.aws.amazon.com/kms/latest/developerguide/abac.html) in the *Key
    # Management Service Developer Guide*.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # When `Truncated` is true, this element is present and contains the value to use for the `Marker`
    # parameter in a subsequent request.
    #
    # Do not assume or infer any information from this value.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A flag that indicates whether there are more items in the list. When this value is true, the
    # list in this response is truncated. To get more items, pass the value of the `NextMarker`
    # element in this response to the `Marker` parameter in a subsequent request.
    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end

    def_equals_and_hash(@tags, @next_marker, @truncated)
  end
end
