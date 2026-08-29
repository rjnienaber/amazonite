private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class ListKeyRotationsRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "IncludeKeyMaterial", converter: AK::IncludeKeyMaterial)]
    property include_key_material : IncludeKeyMaterial | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "Marker")]
    property marker : String | Nil

    def initialize(
      @key_id : String,
      @include_key_material : IncludeKeyMaterial | Nil = nil,
      @limit : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end
  end
end
