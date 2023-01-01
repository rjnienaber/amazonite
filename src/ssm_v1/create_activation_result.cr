module Amazonite::SsmV1
  class CreateActivationResult
    include JSON::Serializable

    @[JSON::Field(key: "ActivationId")]
    property activation_id : String | Nil

    @[JSON::Field(key: "ActivationCode")]
    property activation_code : String | Nil

    def initialize(
      @activation_id : String | Nil = nil,
      @activation_code : String | Nil = nil
    )
    end
  end
end
