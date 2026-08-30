private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetConnectionStatusResponse
    include JSON::Serializable

    # The ID of the managed node to check connection status.
    @[JSON::Field(key: "Target")]
    property target : String | Nil

    # The status of the connection to the managed node.
    @[JSON::Field(key: "Status", converter: AS::ConnectionStatus)]
    property status : ConnectionStatus | Nil

    def initialize(
      @target : String | Nil = nil,
      @status : ConnectionStatus | Nil = nil,
    )
    end

    def_equals_and_hash(@target, @status)
  end
end
