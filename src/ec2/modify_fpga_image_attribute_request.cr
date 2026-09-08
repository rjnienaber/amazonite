private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyFpgaImageAttributeRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the AFI.
    property fpga_image_id : String

    # The name of the attribute.
    property attribute : FpgaImageAttributeName | Nil

    # The operation type.
    property operation_type : OperationType | Nil

    # The Amazon Web Services account IDs. This parameter is valid only when modifying the
    # `loadPermission` attribute.
    property user_ids : Array(String) | Nil

    # The user groups. This parameter is valid only when modifying the `loadPermission` attribute.
    property user_groups : Array(String) | Nil

    # The product codes. After you add a product code to an AFI, it can't be removed. This parameter
    # is valid only when modifying the `productCodes` attribute.
    property product_codes : Array(String) | Nil

    # The load permission for the AFI.
    property load_permission : LoadPermissionModifications | Nil

    # A description for the AFI.
    property description : String | Nil

    # A name for the AFI.
    property name : String | Nil

    def initialize(
      @fpga_image_id : String,
      @dry_run : Bool | Nil = nil,
      @attribute : FpgaImageAttributeName | Nil = nil,
      @operation_type : OperationType | Nil = nil,
      @user_ids : Array(String) | Nil = nil,
      @user_groups : Array(String) | Nil = nil,
      @product_codes : Array(String) | Nil = nil,
      @load_permission : LoadPermissionModifications | Nil = nil,
      @description : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}FpgaImageId", @fpga_image_id}

      if value = @attribute
        params << {"#{prefix}Attribute", value.to_json_object_key}
      end

      if value = @operation_type
        params << {"#{prefix}OperationType", value.to_json_object_key}
      end

      (@user_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UserId.#{i}", item}
      end

      (@user_groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UserGroup.#{i}", item}
      end

      (@product_codes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ProductCode.#{i}", item}
      end

      if value = @load_permission
        params.concat(value.to_query_params("#{prefix}LoadPermission."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @name
        params << {"#{prefix}Name", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        fpga_image_id: Core::XMLValue.string(node.xpath_node("*[local-name()='FpgaImageId']")).not_nil!,
        attribute: (n = node.xpath_node("*[local-name()='Attribute']")) ? AEC::FpgaImageAttributeName.from_json_object_key?(n.content) : nil,
        operation_type: (n = node.xpath_node("*[local-name()='OperationType']")) ? AEC::OperationType.from_json_object_key?(n.content) : nil,
        user_ids: node.xpath_nodes("*[local-name()='UserId']/*[local-name()='UserId']").map { |n| n.content },
        user_groups: node.xpath_nodes("*[local-name()='UserGroup']/*[local-name()='UserGroup']").map { |n| n.content },
        product_codes: node.xpath_nodes("*[local-name()='ProductCode']/*[local-name()='ProductCode']").map { |n| n.content },
        load_permission: node.xpath_node("*[local-name()='LoadPermission']").try { |n| LoadPermissionModifications.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
      )
    end

    def validate! : Nil
      if value = @load_permission
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @fpga_image_id, @attribute, @operation_type, @user_ids, @user_groups, @product_codes, @load_permission, @description, @name)
  end
end
