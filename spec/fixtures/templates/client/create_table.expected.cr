private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class Client < Core::Client
    Log = ::Log.for("amazonite.dynamodb_v2.client")

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", "1.0", nil, config)
    end

    def create_table(input : ADDB::CreateTableInput) : Core::ParsedResponse(ADDB::CreateTableOutput)
      Log.info { "performing 'CreateTable' operation" }
      response = post("CreateTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::CreateTableOutput).new(response)
    end
  end
end
