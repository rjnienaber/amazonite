private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetConnectionStatusRequest
    include JSON::Serializable

    # The managed node ID.
    @[JSON::Field(key: "Target")]
    property target : String

    def initialize(
      @target : String,
    )
    end

    def validate! : Nil
      if value = @target
        raise Core::ValidationError.new("Target length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Target length must be <= 400") if value.size > 400
      end
    end

    def_equals_and_hash(@target)
  end
end
