module Amazonite::SsmV1
  class StartAccessRequestRequest
    include JSON::Serializable

    @[JSON::Field(key: "Reason")]
    property reason : String

    @[JSON::Field(key: "Targets")]
    property targets : Array(Target) = [] of Target

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
