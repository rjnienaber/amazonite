private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetParametersForImportResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "ImportToken")]
    property import_token : String | Nil

    @[JSON::Field(key: "PublicKey")]
    property public_key : String | Nil

    @[JSON::Field(key: "ParametersValidTo", converter: Core::AWSEpochConverter)]
    property parameters_valid_to : Time | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @import_token : String | Nil = nil,
      @public_key : String | Nil = nil,
      @parameters_valid_to : Time | Nil = nil,
    )
    end
  end
end
