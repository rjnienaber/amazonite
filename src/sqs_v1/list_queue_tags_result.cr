module Amazonite::SqsV1
  class ListQueueTagsResult
    include JSON::Serializable

    # The list of all tags added to the specified queue.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@tags)
  end
end
