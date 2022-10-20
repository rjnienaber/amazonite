private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class SSESpecification
    include JSON::Serializable

    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    @[JSON::Field(key: "SSEType", converter: ADDB::SSEType)]
    property ssetype : SSEType | Nil

    @[JSON::Field(key: "KMSMasterKeyId")]
    property kmsmaster_key_id : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @ssetype : SSEType | Nil = nil,
      @kmsmaster_key_id : String | Nil = nil
    )
    end
  end
end
