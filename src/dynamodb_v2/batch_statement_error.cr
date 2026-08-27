private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class BatchStatementError
    include JSON::Serializable

    @[JSON::Field(key: "Code", converter: ADDB::BatchStatementErrorCodeEnum)]
    property code : BatchStatementErrorCodeEnum | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    def initialize(
      @code : BatchStatementErrorCodeEnum | Nil = nil,
      @message : String | Nil = nil,
      @item : Hash(String, AttributeValue) | Nil = nil,
    )
    end
  end
end
