module Amazonite::KmsV1
  class GrantConstraints
    include JSON::Serializable

    @[JSON::Field(key: "EncryptionContextSubset")]
    property encryption_context_subset : Hash(String, String) | Nil

    @[JSON::Field(key: "EncryptionContextEquals")]
    property encryption_context_equals : Hash(String, String) | Nil

    @[JSON::Field(key: "SourceArn")]
    property source_arn : String | Nil

    def initialize(
      @encryption_context_subset : Hash(String, String) | Nil = nil,
      @encryption_context_equals : Hash(String, String) | Nil = nil,
      @source_arn : String | Nil = nil,
    )
    end
  end
end
