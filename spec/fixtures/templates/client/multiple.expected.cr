private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    Log = ::Log.for("amazonite.dynamodb_v2.client")

    def initialize(config = AC::Config.new)
      super("DynamoDB_20120810", "dynamodb", nil, config)
    end

    def put_item(input : ADDB::PutItemInput) : AC::ParsedResponse(ADDB::PutItemOutput)
      Log.info { "performing 'PutItem' operation" }
      response = post("PutItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::PutItemOutput).new(response)
    end

    def get_item(input : ADDB::GetItemInput) : AC::ParsedResponse(ADDB::GetItemOutput)
      Log.info { "performing 'GetItem' operation" }
      response = post("GetItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::GetItemOutput).new(response)
    end

    def update_item(input : ADDB::UpdateItemInput) : AC::ParsedResponse(ADDB::UpdateItemOutput)
      Log.info { "performing 'UpdateItem' operation" }
      response = post("UpdateItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateItemOutput).new(response)
    end

    def delete_item(input : ADDB::DeleteItemInput) : AC::ParsedResponse(ADDB::DeleteItemOutput)
      Log.info { "performing 'DeleteItem' operation" }
      response = post("DeleteItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::DeleteItemOutput).new(response)
    end
  end
end
