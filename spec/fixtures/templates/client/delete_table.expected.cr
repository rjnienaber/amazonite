private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class Client < Core::Client
    Log               = ::Log.for("amazonite.dynamodb_v2.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", EXCEPTION_FACTORY, config)
    end

    def delete_table(input : ADDB::DeleteTableInput) : Core::ParsedResponse(ADDB::DeleteTableOutput)
      Log.info { "performing 'DeleteTable' operation" }
      response = post("DeleteTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::DeleteTableOutput).new(response)
    end
  end
end
