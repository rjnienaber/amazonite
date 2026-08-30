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

    def_equals_and_hash(@name, @account)
  end
end
