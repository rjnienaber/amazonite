module Amazonite::LambdaV1
  class Filter
    include JSON::Serializable

    @[JSON::Field(key: "Pattern")]
    property pattern : String | Nil

    def initialize(
      @pattern : String | Nil = nil,
    )
    end
  end
end
