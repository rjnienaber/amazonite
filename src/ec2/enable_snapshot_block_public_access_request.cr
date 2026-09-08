private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableSnapshotBlockPublicAccessRequest
    # The mode in which to enable block public access for snapshots for the Region. Specify one of the
    # following values:
    #
    # - `block-all-sharing` - Prevents all public sharing of snapshots in the Region. Users in the
    # account will no longer be able to request new public sharing. Additionally, snapshots that are
    # already publicly shared are treated as private and they are no longer publicly available.
    #
    # - `block-new-sharing` - Prevents only new public sharing of snapshots in the Region. Users in
    # the account will no longer be able to request new public sharing. However, snapshots that are
    # already publicly shared, remain publicly available.
    #
    # `unblocked` is not a valid value for **EnableSnapshotBlockPublicAccess**.
    property state : SnapshotBlockPublicAccessState

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @state : SnapshotBlockPublicAccessState,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}State", @state.to_json_object_key}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: ((n = node.xpath_node("*[local-name()='State']")) ? AEC::SnapshotBlockPublicAccessState.from_json_object_key?(n.content) : nil).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @dry_run)
  end
end
