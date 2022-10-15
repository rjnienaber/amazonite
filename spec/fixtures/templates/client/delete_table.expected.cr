module Amazonite::DynamoDB
  class Client < Amazonite::Core::Client
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("DynamoDB_20120810", "dynamodb", EXCEPTION_FACTORY, base_url, user_agent)
    end

    def delete_table(input : Amazonite::DynamoDB::DeleteTableInput) : Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::DeleteTableOutput)
      response = post("DeleteTable", "/", input.to_json)
      Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::DeleteTableOutput).new(response)
    end
  end
end