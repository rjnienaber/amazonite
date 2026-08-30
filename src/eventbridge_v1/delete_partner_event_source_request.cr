module Amazonite::EventBridgeV1
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

    def_equals_and_hash(@name, @account)
  end
end
