private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  # Configuration for tag propagation to managed resources launched by the capacity provider.
  class PropagateTags
    include JSON::Serializable

    # The tag propagation mode. Set to `Explicit` to propagate the tags specified in `ExplicitTags` to
    # managed resources. Set to `None` to disable tag propagation.
    @[JSON::Field(key: "Mode", converter: AL::PropagateTagsMode)]
    property mode : PropagateTagsMode | Nil

    # A list of tags to apply to managed resources when `Mode` is set to `Explicit`. You can specify
    # up to 40 tags.
    @[JSON::Field(key: "ExplicitTags")]
    property explicit_tags : Hash(String, String) | Nil

    def initialize(
      @mode : PropagateTagsMode | Nil = nil,
      @explicit_tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@mode, @explicit_tags)
  end
end
