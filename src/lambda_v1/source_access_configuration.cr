private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class SourceAccessConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "Type", converter: AL::SourceAccessType)]
    property type : SourceAccessType | Nil

    @[JSON::Field(key: "URI")]
    property uri : String | Nil

    def initialize(
      @type : SourceAccessType | Nil = nil,
      @uri : String | Nil = nil,
    )
    end
  end
end
