private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateKmsKeyIdRequest
    # The ID of the Amazon EBS snapshot.
    property snapshot_id : String | Nil

    # The ID, alias, or ARN of the associated KMS key to remove from the snapshot.
    property kms_key_id : String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @kms_key_id : String,
      @snapshot_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      params << {"#{prefix}KmsKeyId", @kms_key_id}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")),
        kms_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyId']")).not_nil!,
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @kms_key_id, @dry_run)
  end
end
