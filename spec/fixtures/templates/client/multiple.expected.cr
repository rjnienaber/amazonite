private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class Client < Core::Client
    Log = ::Log.for("amazonite.dynamodb_v2.client")

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", "1.0", nil, config)
    end

    def put_item(input : ADDB::PutItemInput) : Core::ParsedResponse(ADDB::PutItemOutput)
      Log.info { "performing 'PutItem' operation" }
      response = post("PutItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::PutItemOutput).new(response)
    end

    def get_item(input : ADDB::GetItemInput) : Core::ParsedResponse(ADDB::GetItemOutput)
      Log.info { "performing 'GetItem' operation" }
      response = post("GetItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::GetItemOutput).new(response)
    end

    def update_item(input : ADDB::UpdateItemInput) : Core::ParsedResponse(ADDB::UpdateItemOutput)
      Log.info { "performing 'UpdateItem' operation" }
      response = post("UpdateItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateItemOutput).new(response)
    end

    def delete_item(input : ADDB::DeleteItemInput) : Core::ParsedResponse(ADDB::DeleteItemOutput)
      Log.info { "performing 'DeleteItem' operation" }
      response = post("DeleteItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::DeleteItemOutput).new(response)
    end
  end
end
