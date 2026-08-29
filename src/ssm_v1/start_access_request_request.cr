module Amazonite::SsmV1
  class StartAccessRequestRequest
    include JSON::Serializable

    # A brief description explaining why you are requesting access to the node.
    @[JSON::Field(key: "Reason")]
    property reason : String

    # The node you are requesting access to.
    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) = [] of Target

    # Key-value pairs of metadata you want to assign to the access request.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @reason : String,
      @targets : Array(Target),
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
