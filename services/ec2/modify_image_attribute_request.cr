private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for ModifyImageAttribute.
  class ModifyImageAttributeRequest
    # The name of the attribute to modify.
    #
    # Valid values: `description` | `imdsSupport` | `launchPermission`
    property attribute : String | Nil

    # A new description for the AMI.
    property description : AttributeValue | Nil

    # The ID of the AMI.
    property image_id : String

    # A new launch permission for the AMI.
    property launch_permission : LaunchPermissionModifications | Nil

    # The operation type. This parameter can be used only when the `Attribute` parameter is
    # `launchPermission`.
    property operation_type : OperationType | Nil

    # Not supported.
    property product_codes : Array(String) | Nil

    # The user groups. This parameter can be used only when the `Attribute` parameter is
    # `launchPermission`.
    property user_groups : Array(String) | Nil

    # The Amazon Web Services account IDs. This parameter can be used only when the `Attribute`
    # parameter is `launchPermission`.
    property user_ids : Array(String) | Nil

    # The value of the attribute being modified. This parameter can be used only when the `Attribute`
    # parameter is `description` or `imdsSupport`.
    property value : String | Nil

    # The Amazon Resource Name (ARN) of an organization. This parameter can be used only when the
    # `Attribute` parameter is `launchPermission`.
    property organization_arns : Array(String) | Nil

    # The Amazon Resource Name (ARN) of an organizational unit (OU). This parameter can be used only
    # when the `Attribute` parameter is `launchPermission`.
    property organizational_unit_arns : Array(String) | Nil

    # Set to `v2.0` to indicate that IMDSv2 is specified in the AMI. Instances launched from this AMI
    # will have `HttpTokens` automatically set to `required` so that, by default, the instance
    # requires that IMDSv2 is used when requesting instance metadata. In addition,
    # `HttpPutResponseHopLimit` is set to `2`. For more information, see [Configure the
    # AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-IMDS-new-instances.html#configure-IMDS-new-instances-ami-configuration)
    # in the *Amazon EC2 User Guide*.
    #
    # Do not use this parameter unless your AMI software supports IMDSv2. After you set the value to
    # `v2.0`, you can't undo it. The only way to “reset” your AMI is to create a new AMI from the
    # underlying snapshot.
    property imds_support : AttributeValue | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @image_id : String,
      @attribute : String | Nil = nil,
      @description : AttributeValue | Nil = nil,
      @launch_permission : LaunchPermissionModifications | Nil = nil,
      @operation_type : OperationType | Nil = nil,
      @product_codes : Array(String) | Nil = nil,
      @user_groups : Array(String) | Nil = nil,
      @user_ids : Array(String) | Nil = nil,
      @value : String | Nil = nil,
      @organization_arns : Array(String) | Nil = nil,
      @organizational_unit_arns : Array(String) | Nil = nil,
      @imds_support : AttributeValue | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @attribute
        params << {"#{prefix}Attribute", value}
      end

      if value = @description
        params.concat(value.to_query_params("#{prefix}Description."))
      end

      params << {"#{prefix}ImageId", @image_id}

      if value = @launch_permission
        params.concat(value.to_query_params("#{prefix}LaunchPermission."))
      end

      if value = @operation_type
        params << {"#{prefix}OperationType", value.to_json_object_key}
      end

      (@product_codes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ProductCode.#{i}", item}
      end

      (@user_groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UserGroup.#{i}", item}
      end

      (@user_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UserId.#{i}", item}
      end

      if value = @value
        params << {"#{prefix}Value", value}
      end

      (@organization_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OrganizationArn.#{i}", item}
      end

      (@organizational_unit_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OrganizationalUnitArn.#{i}", item}
      end

      if value = @imds_support
        params.concat(value.to_query_params("#{prefix}ImdsSupport."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attribute: Core::XMLValue.string(node.xpath_node("*[local-name()='Attribute']")),
        description: node.xpath_node("*[local-name()='Description']").try { |n| AttributeValue.from_xml(n) },
        image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ImageId']")).not_nil!,
        launch_permission: node.xpath_node("*[local-name()='LaunchPermission']").try { |n| LaunchPermissionModifications.from_xml(n) },
        operation_type: (n = node.xpath_node("*[local-name()='OperationType']")) ? AEC::OperationType.from_json_object_key?(n.content) : nil,
        product_codes: node.xpath_nodes("*[local-name()='ProductCode']/*[local-name()='ProductCode']").map { |n| n.content },
        user_groups: node.xpath_nodes("*[local-name()='UserGroup']/*[local-name()='UserGroup']").map { |n| n.content },
        user_ids: node.xpath_nodes("*[local-name()='UserId']/*[local-name()='UserId']").map { |n| n.content },
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
        organization_arns: node.xpath_nodes("*[local-name()='OrganizationArn']/*[local-name()='OrganizationArn']").map { |n| n.content },
        organizational_unit_arns: node.xpath_nodes("*[local-name()='OrganizationalUnitArn']/*[local-name()='OrganizationalUnitArn']").map { |n| n.content },
        imds_support: node.xpath_node("*[local-name()='ImdsSupport']").try { |n| AttributeValue.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @description
        value.validate!
      end

      if value = @launch_permission
        value.validate!
      end

      if value = @imds_support
        value.validate!
      end
    end

    def_equals_and_hash(@attribute, @description, @image_id, @launch_permission, @operation_type, @product_codes, @user_groups, @user_ids, @value, @organization_arns, @organizational_unit_arns, @imds_support, @dry_run)
  end
end
