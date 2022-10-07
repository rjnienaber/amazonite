module Amazonite::DynamoDB
  class Client < Amazonite::Core::Client
    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("DynamoDB_20120810", "dynamodb", base_url, user_agent)
    end

    def create_table(input : Amazonite::DynamoDB::CreateTableInput) : Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::CreateTableOutput)
      response = post("CreateTable", "/", input.to_json)
      Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::CreateTableOutput).new(response)
    end
  end
end
