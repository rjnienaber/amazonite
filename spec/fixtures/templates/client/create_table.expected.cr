private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    Log = ::Log.for("amazonite.dynamodb_v2.client")

    def initialize(config = AC::Config.new)
      super("DynamoDB_20120810", "dynamodb", nil, config)
    end

    def create_table(input : ADDB::CreateTableInput) : AC::ParsedResponse(ADDB::CreateTableOutput)
      Log.info { "performing 'CreateTable' operation" }
      response = post("CreateTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::CreateTableOutput).new(response)
    end
  end
end
