module Amazonite::ComprehendV2
  class DocumentLabel
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "Score")]
    property score : Float32 | Nil

    def initialize(
      @name : String | Nil = nil,
      @score : Float32 | Nil = nil
    )
    end
  end
end
