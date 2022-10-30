private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class SSESpecification
    include JSON::Serializable

    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    @[JSON::Field(key: "SSEType", converter: ADDB::SSEType)]
    property sse_type : SSEType | Nil

    @[JSON::Field(key: "KMSMasterKeyId")]
    property kms_master_key_id : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @sse_type : SSEType | Nil = nil,
      @kms_master_key_id : String | Nil = nil
    )
    end
  end
end
