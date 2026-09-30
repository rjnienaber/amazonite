private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifySnapshotAttributeRequest
    # The snapshot attribute to modify. Only volume creation permissions can be modified.
    property attribute : SnapshotAttributeName | Nil

    # A JSON representation of the snapshot attribute modification.
    property create_volume_permission : CreateVolumePermissionModifications | Nil

    # The group to modify for the snapshot.
    property group_names : Array(String) | Nil

    # The type of operation to perform to the attribute.
    property operation_type : OperationType | Nil

    # The ID of the snapshot.
    property snapshot_id : String

    # The account ID to modify for the snapshot.
    property user_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @snapshot_id : String,
      @attribute : SnapshotAttributeName | Nil = nil,
      @create_volume_permission : CreateVolumePermissionModifications | Nil = nil,
      @group_names : Array(String) | Nil = nil,
      @operation_type : OperationType | Nil = nil,
      @user_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attribute
        params << {"#{prefix}Attribute", value.to_json_object_key}
      end

      if value = @create_volume_permission
        params.concat(value.to_query_params("#{prefix}CreateVolumePermission."))
      end

      (@group_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UserGroup.#{i}", item}
      end

      if value = @operation_type
        params << {"#{prefix}OperationType", value.to_json_object_key}
      end

      params << {"#{prefix}SnapshotId", @snapshot_id}

      (@user_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UserId.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute: (n = node.xpath_node("*[local-name()='Attribute']")) ? AEC::SnapshotAttributeName.from_json_object_key?(n.content) : nil,
        create_volume_permission: node.xpath_node("*[local-name()='CreateVolumePermission']").try { |n| CreateVolumePermissionModifications.from_xml(n) },
        group_names: node.xpath_nodes("*[local-name()='UserGroup']/*[local-name()='GroupName']").map { |n| n.content },
        operation_type: (n = node.xpath_node("*[local-name()='OperationType']")) ? AEC::OperationType.from_json_object_key?(n.content) : nil,
        snapshot_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SnapshotId']")).not_nil!,
        user_ids: node.xpath_nodes("*[local-name()='UserId']/*[local-name()='UserId']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @create_volume_permission
        value.validate!
      end
    end

    def_equals_and_hash(@attribute, @create_volume_permission, @group_names, @operation_type, @snapshot_id, @user_ids, @dry_run)
  end
end
