private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class ListKeyPoliciesResponse
    include JSON::Serializable

    # A list of key policy names. The only valid value is `default`.
    @[JSON::Field(key: "PolicyNames")]
    property policy_names : Array(String) | Nil

    # When `Truncated` is true, this element is present and contains the value to use for the `Marker`
    # parameter in a subsequent request.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    # A flag that indicates whether there are more items in the list. When this value is true, the
    # list in this response is truncated. To get more items, pass the value of the `NextMarker`
    # element in this response to the `Marker` parameter in a subsequent request.
    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @policy_names : Array(String) | Nil = nil,
      @next_marker : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_marker
        raise Core::ValidationError.new("NextMarker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextMarker length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("NextMarker does not match the required pattern") unless value.matches?(Regex.new("^[ -ÿ]*$"))
      end
    end

    def_equals_and_hash(@policy_names, @next_marker, @truncated)
  end
end
