private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  class GenerateDataKeyWithoutPlaintextRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "EncryptionContext")]
    property encryption_context : Hash(String, String) | Nil

    @[JSON::Field(key: "KeySpec", converter: AK::DataKeySpec)]
    property key_spec : DataKeySpec | Nil

    @[JSON::Field(key: "NumberOfBytes")]
    property number_of_bytes : Int32 | Nil

    @[JSON::Field(key: "GrantTokens")]
    property grant_tokens : Array(String) | Nil

    @[JSON::Field(key: "DryRun")]
    property dry_run : Bool | Nil

    def initialize(
      @key_id : String,
      @encryption_context : Hash(String, String) | Nil = nil,
      @key_spec : DataKeySpec | Nil = nil,
      @number_of_bytes : Int32 | Nil = nil,
      @grant_tokens : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end
  end
end
