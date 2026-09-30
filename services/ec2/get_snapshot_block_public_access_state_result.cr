private alias AEC = Amazonite::EC2

module Amazonite::EC2
  class GetSnapshotBlockPublicAccessStateResult
    # The current state of block public access for snapshots. Possible values include:
    #
    # - `block-all-sharing` - All public sharing of snapshots is blocked. Users in the account can't
    # request new public sharing. Additionally, snapshots that were already publicly shared are
    # treated as private and are not publicly available.
    #
    # - `block-new-sharing` - Only new public sharing of snapshots is blocked. Users in the account
    # can't request new public sharing. However, snapshots that were already publicly shared, remain
    # publicly available.
    #
    # - `unblocked` - Public sharing is not blocked. Users can publicly share snapshots.
    property state : SnapshotBlockPublicAccessState | Nil

    # The entity that manages the state for block public access for snapshots. Possible values
    # include:
    #
    # - `account` - The state is managed by the account.
    #
    # - `declarative-policy` - The state is managed by a declarative policy and can't be modified by
    # the account.
    property managed_by : ManagedBy | Nil

    def initialize(
      @state : SnapshotBlockPublicAccessState | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SnapshotBlockPublicAccessState.from_json_object_key?(n.content) : nil,
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @managed_by)
  end
end
