private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ListTagsForResourceResult
    include JSON::Serializable

    # A list of tags.
    @[JSON::Field(key: "TagList")]
    property tag_list : Array(Tag) | Nil

    def initialize(
      @tag_list : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @tag_list
        raise Core::ValidationError.new("TagList must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("TagList must have at most 1000 item(s)") if value.size > 1000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tag_list)
  end
end
