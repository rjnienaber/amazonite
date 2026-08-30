private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @activation_id
        raise Core::ValidationError.new("ActivationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@activation_id)
  end
end
