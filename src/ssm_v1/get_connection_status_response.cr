private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class GetConnectionStatusResponse
    include JSON::Serializable

    @[JSON::Field(key: "Target")]
    property target : String | Nil

    @[JSON::Field(key: "Status", converter: AS::ConnectionStatus)]
    property status : ConnectionStatus | Nil

    def initialize(
      @target : String | Nil = nil,
      @status : ConnectionStatus | Nil = nil
    )
    end
  end
end
