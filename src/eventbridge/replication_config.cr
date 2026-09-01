private alias AEB = Amazonite::EventBridge

module Amazonite::EventBridge
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

    def validate! : Nil
    end

    def_equals_and_hash(@state)
  end
end
