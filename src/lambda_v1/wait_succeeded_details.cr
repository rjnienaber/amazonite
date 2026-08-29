module Amazonite::LambdaV1
  class WaitSucceededDetails
    include JSON::Serializable

    @[JSON::Field(key: "Duration")]
    property duration : Int32 | Nil

    def initialize(
      @duration : Int32 | Nil = nil,
    )
    end
  end
end
