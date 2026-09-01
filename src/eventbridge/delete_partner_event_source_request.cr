private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class DeletePartnerEventSourceRequest
    include JSON::Serializable

    # The name of the event source to delete.
    @[JSON::Field(key: "Name")]
    property name : String

    # The Amazon Web Services account ID of the Amazon Web Services customer that the event source was
    # created for.
    @[JSON::Field(key: "Account")]
    property account : String

    def initialize(
      @name : String,
      @account : String,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^aws\\.partner(/[\\.\\-_A-Za-z0-9]+){2,}$"))
      end

      if value = @account
        raise Core::ValidationError.new("Account length must be >= 12") if value.size < 12
        raise Core::ValidationError.new("Account length must be <= 12") if value.size > 12
        raise Core::ValidationError.new("Account does not match the required pattern") unless value.matches?(Regex.new("^\\d{12}$"))
      end
    end

    def_equals_and_hash(@name, @account)
  end
end
