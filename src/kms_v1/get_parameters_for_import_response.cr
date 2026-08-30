private alias Core = Amazonite::Core

module Amazonite::KmsV1
  class GetParametersForImportResponse
    include JSON::Serializable

    # The Amazon Resource Name ([key
    # ARN](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id-key-ARN)) of the
    # KMS key to use in a subsequent ImportKeyMaterial request. This is the same KMS key specified in
    # the `GetParametersForImport` request.
    @[JSON::Field(key: "KeyId")]
    property key_id : String | Nil

    # The import token to send in a subsequent ImportKeyMaterial request.
    @[JSON::Field(key: "ImportToken", converter: Core::Base64Converter)]
    property import_token : Bytes | Nil

    # The public key to use to encrypt the key material before importing it with ImportKeyMaterial.
    @[JSON::Field(key: "PublicKey", converter: Core::Base64Converter)]
    property public_key : Bytes | Nil

    # The time at which the import token and public key are no longer valid. After this time, you
    # cannot use them to make an ImportKeyMaterial request and you must send another
    # `GetParametersForImport` request to get new ones.
    @[JSON::Field(key: "ParametersValidTo", converter: Core::AWSEpochConverter)]
    property parameters_valid_to : Time | Nil

    def initialize(
      @key_id : String | Nil = nil,
      @import_token : Bytes | Nil = nil,
      @public_key : Bytes | Nil = nil,
      @parameters_valid_to : Time | Nil = nil,
    )
    end

    def_equals_and_hash(@key_id, @import_token, @public_key, @parameters_valid_to)
  end
end
