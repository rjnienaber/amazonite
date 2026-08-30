module Amazonite::SsmV1
  class SendCommandResult
    include JSON::Serializable

    # The request as it was received by Systems Manager. Also provides the command ID which can be
    # used future references to this request.
    @[JSON::Field(key: "Command")]
    property command : Command | Nil

    def initialize(
      @command : Command | Nil = nil,
    )
    end

    def_equals_and_hash(@command)
  end
end
