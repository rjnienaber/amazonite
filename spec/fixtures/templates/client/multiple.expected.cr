module Amazonite::DynamoDB
  class Client < Amazonite::Core::Client
    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("DynamoDB_20120810", "dynamodb", base_url, user_agent)
    end

    def put_item(input : Amazonite::DynamoDB::PutItemInput) : Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::PutItemOutput)
      response = post("PutItem", "/", input.to_json)
      Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::PutItemOutput).new(response)
    end

    def get_item(input : Amazonite::DynamoDB::GetItemInput) : Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::GetItemOutput)
      response = post("GetItem", "/", input.to_json)
      Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::GetItemOutput).new(response)
    end

    def update_item(input : Amazonite::DynamoDB::UpdateItemInput) : Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::UpdateItemOutput)
      response = post("UpdateItem", "/", input.to_json)
      Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::UpdateItemOutput).new(response)
    end

    def delete_item(input : Amazonite::DynamoDB::DeleteItemInput) : Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::DeleteItemOutput)
      response = post("DeleteItem", "/", input.to_json)
      Amazonite::Core::ParsedResponse(Amazonite::DynamoDB::DeleteItemOutput).new(response)
    end
  end
end