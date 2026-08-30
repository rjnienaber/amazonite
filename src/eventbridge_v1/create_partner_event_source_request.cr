private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class CreatePartnerEventSourceRequest
    include JSON::Serializable

    # The name of the partner event source. This name must be unique and must be in the format `
    # *partner_name*/*event_namespace*/*event_name* `. The Amazon Web Services account that wants to
    # use this partner event source must create a partner event bus with a name that matches the name
    # of the partner event source.
    @[JSON::Field(key: "Name")]
    property name : String

    # The Amazon Web Services account ID that is permitted to create a matching partner event bus for
    # this partner event source.
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
