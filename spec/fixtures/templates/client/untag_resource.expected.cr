private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    def initialize(config = AC::Config.new)
      super("DynamoDB_20120810", "dynamodb", nil, config)
    end

    def untag_resource(input : ADDB::UntagResourceInput) : AC::Response
      response = post("UntagResource", "/", input.to_json)
      AC::Response.new(response)
    end
  end
end
