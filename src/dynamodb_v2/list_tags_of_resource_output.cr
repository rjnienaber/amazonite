private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ListTagsOfResourceOutput
    include JSON::Serializable

    # The tags currently associated with the Amazon DynamoDB resource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # If this value is returned, there are additional results to be displayed. To retrieve them, call
    # ListTagsOfResource again, with NextToken set to this value.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tags, @next_token)
  end
end
