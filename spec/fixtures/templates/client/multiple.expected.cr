private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("DynamoDB_20120810", "dynamodb", nil, base_url, user_agent)
    end

    def put_item(input : ADDB::PutItemInput) : AC::ParsedResponse(ADDB::PutItemOutput)
      response = post("PutItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::PutItemOutput).new(response)
    end

    def get_item(input : ADDB::GetItemInput) : AC::ParsedResponse(ADDB::GetItemOutput)
      response = post("GetItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::GetItemOutput).new(response)
    end

    def update_item(input : ADDB::UpdateItemInput) : AC::ParsedResponse(ADDB::UpdateItemOutput)
      response = post("UpdateItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateItemOutput).new(response)
    end

    def delete_item(input : ADDB::DeleteItemInput) : AC::ParsedResponse(ADDB::DeleteItemOutput)
      response = post("DeleteItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::DeleteItemOutput).new(response)
    end
  end
end
