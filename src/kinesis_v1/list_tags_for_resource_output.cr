private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class ListTagsForResourceOutput
    include JSON::Serializable

    # An array of tags associated with the specified Kinesis resource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 200 item(s)") if value.size > 200
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tags)
  end
end
