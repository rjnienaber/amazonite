private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class Client < Core::Client
    Log = ::Log.for("amazonite.dynamodb_v2.client")

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", "1.0", nil, config)
    end

    def untag_resource(input : ADDB::UntagResourceInput) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      response = post("UntagResource", "/", input.to_json)
      Core::Response.new(response)
    end
  end
end
