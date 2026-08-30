private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DeleteDeliverySourceRequest
    include JSON::Serializable

    # The name of the delivery source that you want to delete.
    @[JSON::Field(key: "name")]
    property name : String

    def initialize(
      @name : String,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("name length must be <= 60") if value.size > 60
        raise Core::ValidationError.new("name does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]*$"))
      end
    end

    def_equals_and_hash(@name)
  end
end
