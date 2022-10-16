private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("DynamoDB_20120810", "dynamodb", EXCEPTION_FACTORY, base_url, user_agent)
    end

    def delete_table(input : ADDB::DeleteTableInput) : AC::ParsedResponse(ADDB::DeleteTableOutput)
      response = post("DeleteTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::DeleteTableOutput).new(response)
    end
  end
end