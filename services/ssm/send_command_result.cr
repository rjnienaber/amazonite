private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @command
        value.validate!
      end
    end

    def_equals_and_hash(@command)
  end
end
