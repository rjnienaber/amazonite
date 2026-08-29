private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetParametersForImportResponse
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    @[JSON::Field(key: "ImportToken", converter: Core::Base64Converter)]
    property import_token : Bytes | Nil

    @[JSON::Field(key: "PublicKey", converter: Core::Base64Converter)]
    property public_key : Bytes | Nil

    @[JSON::Field(key: "ParametersValidTo", converter: Core::AWSEpochConverter)]
    property parameters_valid_to : Time | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @import_token : Bytes | Nil = nil,
      @public_key : Bytes | Nil = nil,
      @parameters_valid_to : Time | Nil = nil,
    )
    end
  end
end
