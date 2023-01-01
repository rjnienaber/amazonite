module Amazonite::SsmV1
  class DeleteActivationRequest
    include JSON::Serializable

    @[JSON::Field(key: "ActivationId")]
    property activation_id : String

    def initialize(
      @activation_id : String
    )
    end
  end
end
