private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class BatchStatementError
    include JSON::Serializable

    @[JSON::Field(key: "Code", converter: ADDB::BatchStatementErrorCodeEnum)]
    property code : BatchStatementErrorCodeEnum | Nil

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @code : BatchStatementErrorCodeEnum | Nil = nil,
      @message : String | Nil = nil
    )
    end
  end
end