module Amazonite::SsmV1
  class DeleteActivationRequest
    include JSON::Serializable

    # The ID of the activation that you want to delete.
    @[JSON::Field(key: "ActivationId")]
    property activation_id : String

    def initialize(
      @activation_id : String,
    )
    end

    def_equals_and_hash(@activation_id)
  end
end
