module Amazonite::DynamoDB
  class Client < Amazonite::Core::Client
    def initialize(base_url : String | Nil = nil, user_agent : String | Nil = nil)
      super("DynamoDB_20120810", "dynamodb", nil, base_url, user_agent)
    end

    def untag_resource(input : Amazonite::DynamoDB::UntagResourceInput) : Amazonite::Core::Response
      response = post("UntagResource", "/", input.to_json)
      Amazonite::Core::Response.new(response)
    end
  end
end
