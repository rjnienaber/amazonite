private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  # The parameters for disassociating the local replica from a global table using Version 2019.11.21
  # with multi-Region eventual consistency (MREC).
  #
  # After disassociation completes, the replica remains a standalone regional table that keeps its
  # data, indexes, and table settings.
  #
  # For request requirements, see
  # [UpdateTable](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_UpdateTable.html).
  # For prerequisites, the protection update, and completion checks, see [Disassociating a global
  # table
  # replica](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables-disassociate.html)
  # in the *Amazon DynamoDB Developer Guide*.
  class DisassociateReplicationGroupMemberAction
    include JSON::Serializable

    # The Region of the replica to disassociate. Set this value to the Region where you send the
    # `UpdateTable` request. You must use credentials for the account that owns the replica.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    # The mode for handling pending replication before disassociation completes. You must specify
    # `WAIT_FOR_REPLICATION`. For more information, see [Disassociating a global table
    # replica](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables-disassociate.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "DisassociationMode", converter: ADDB::DisassociationMode)]
    property disassociation_mode : DisassociationMode

    def initialize(
      @region_name : String,
      @disassociation_mode : DisassociationMode,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@region_name, @disassociation_mode)
  end
end
