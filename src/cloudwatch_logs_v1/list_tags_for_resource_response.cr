private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListTagsForResourceResponse
    include JSON::Serializable

    # The list of tags associated with the requested resource.>
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@tags)
  end
end
