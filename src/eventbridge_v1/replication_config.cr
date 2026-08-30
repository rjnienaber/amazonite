private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # Endpoints can replicate all events to the secondary Region.
  class ReplicationConfig
    include JSON::Serializable

    # The state of event replication.
    @[JSON::Field(key: "State", converter: AEB::ReplicationState)]
    property state : ReplicationState | Nil

    def initialize(
      @state : ReplicationState | Nil = nil,
    )
    end
  end
end
