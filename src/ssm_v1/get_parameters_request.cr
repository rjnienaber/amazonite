module Amazonite::SsmV1
  class GetParametersRequest
    include JSON::Serializable

    @[JSON::Field(key: "Names")]
    property names : Array(String)

    @[JSON::Field(key: "WithDecryption")]
    property with_decryption : Bool | Nil

    def initialize(
      @names : Array(String),
      @with_decryption : Bool | Nil = nil
    )
    end
  end
end
