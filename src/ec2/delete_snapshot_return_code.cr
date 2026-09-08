private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The snapshot ID and its deletion result code.
  class DeleteSnapshotReturnCode
    # The ID of the snapshot.
    property snapshot_id : String | Nil

    # The result code from the snapshot deletion attempt. Possible values:
    #
    # - `success` - The snapshot was successfully deleted.
    #
    # - `skipped` - The snapshot was not deleted because it's associated with other AMIs.
    #
    # - `missing-permissions` - The snapshot was not deleted because the role lacks `DeleteSnapshot`
    # permissions. For more information, see [How Amazon EBS works with
    # IAM](https://docs.aws.amazon.com/ebs/latest/userguide/security_iam_service-with-iam.html).
    #
    # - `internal-error` - The snapshot was not deleted due to a server error.
    #
    # - `client-error` - The snapshot was not deleted due to a client configuration error.
    #
    # For details about an error, check the `DeleteSnapshot` event in the CloudTrail event history.
    # For more information, see [View event
    # history](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/tutorial-event-history.html)
    # in the *Amazon Web Services CloudTrail User Guide*.
    property return_code : SnapshotReturnCodes | Nil

    def initialize(
      @snapshot_id : String | Nil = nil,
      @return_code : SnapshotReturnCodes | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @snapshot_id
        params << {"#{prefix}SnapshotId", value}
      end

      if value = @return_code
        params << {"#{prefix}ReturnCode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='snapshotId']")),
        return_code: (n = node.xpath_node("*[local-name()='returnCode']")) ? AEC::SnapshotReturnCodes.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@snapshot_id, @return_code)
  end
end
