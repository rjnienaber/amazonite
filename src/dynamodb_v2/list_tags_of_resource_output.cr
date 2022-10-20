module Amazonite::DynamoDBv2
  class ListTagsOfResourceOutput
    include JSON::Serializable

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
