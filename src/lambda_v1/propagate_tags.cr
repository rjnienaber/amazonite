private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class PropagateTags
    include JSON::Serializable

    @[JSON::Field(key: "Mode", converter: AL::PropagateTagsMode)]
    property mode : PropagateTagsMode | Nil

    @[JSON::Field(key: "ExplicitTags")]
    property explicit_tags : Hash(String, String) | Nil

    def initialize(
      @mode : PropagateTagsMode | Nil = nil,
      @explicit_tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
