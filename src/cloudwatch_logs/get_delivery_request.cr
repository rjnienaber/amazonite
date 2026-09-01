private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class GetDeliveryRequest
    include JSON::Serializable

    # The ID of the delivery that you want to retrieve.
    @[JSON::Field(key: "id")]
    property id : String

    def initialize(
      @id : String,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("id does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z]+$"))
      end
    end

    def_equals_and_hash(@id)
  end
end
