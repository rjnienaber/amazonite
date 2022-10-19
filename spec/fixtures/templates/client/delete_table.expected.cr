private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = AC::Config.new)
      super("DynamoDB_20120810", "dynamodb", EXCEPTION_FACTORY, config)
    end

    def delete_table(input : ADDB::DeleteTableInput) : AC::ParsedResponse(ADDB::DeleteTableOutput)
      response = post("DeleteTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::DeleteTableOutput).new(response)
    end
  end
end