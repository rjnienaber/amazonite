module Amazonite::SsmV1
  class SendCommandResult
    include JSON::Serializable

    @[JSON::Field(key: "Command")]
    property command : Command | Nil

    def initialize(
      @command : Command | Nil = nil
    )
    end
  end
end
