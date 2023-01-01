module Amazonite::SsmV1
  class GetParameterRequest
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "WithDecryption")]
    property with_decryption : Bool | Nil

    def initialize(
      @name : String,
      @with_decryption : Bool | Nil = nil
    )
    end
  end
end
