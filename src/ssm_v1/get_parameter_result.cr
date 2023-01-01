module Amazonite::SsmV1
  class GetParameterResult
    include JSON::Serializable

    @[JSON::Field(key: "Parameter")]
    property parameter : Parameter | Nil

    def initialize(
      @parameter : Parameter | Nil = nil
    )
    end
  end
end
