private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("DynamoDB_20120810", "dynamodb", nil, base_url, user_agent)
    end

    def untag_resource(input : ADDB::UntagResourceInput) : AC::Response
      response = post("UntagResource", "/", input.to_json)
      AC::Response.new(response)
    end
  end
end
