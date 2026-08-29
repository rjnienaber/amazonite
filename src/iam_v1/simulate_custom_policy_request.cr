private alias Core = Amazonite::Core

module Amazonite::IamV1
  class SimulateCustomPolicyRequest
    property policy_input_list : Array(String) = [] of String

    property permissions_boundary_policy_input_list : Array(String) | Nil

    property ordered_organization_policy_input_list : Array(OrderedOrganizationPolicyType) | Nil

    property action_names : Array(String) = [] of String

    property resource_arns : Array(String) | Nil

    property resource_policy : String | Nil

    property resource_owner : String | Nil

    property caller_arn : String | Nil

    property context_entries : Array(ContextEntry) | Nil

    property resource_handling_option : String | Nil

    property max_items : Int32 | Nil

    property marker : String | Nil

    def initialize(
      @policy_input_list : Array(String),
      @action_names : Array(String),
      @permissions_boundary_policy_input_list : Array(String) | Nil = nil,
      @ordered_organization_policy_input_list : Array(OrderedOrganizationPolicyType) | Nil = nil,
      @resource_arns : Array(String) | Nil = nil,
      @resource_policy : String | Nil = nil,
      @resource_owner : String | Nil = nil,
      @caller_arn : String | Nil = nil,
      @context_entries : Array(ContextEntry) | Nil = nil,
      @resource_handling_option : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @policy_input_list.each_with_index(1) do |item, i|
        params << {"#{prefix}PolicyInputList.member.#{i}", item}
      end

      (@permissions_boundary_policy_input_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PermissionsBoundaryPolicyInputList.member.#{i}", item}
      end

      (@ordered_organization_policy_input_list || [] of OrderedOrganizationPolicyType).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OrderedOrganizationPolicyInputList.member.#{i}."))
      end

      @action_names.each_with_index(1) do |item, i|
        params << {"#{prefix}ActionNames.member.#{i}", item}
      end

      (@resource_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}ResourceArns.member.#{i}", item}
      end

      if value = @resource_policy
        params << {"#{prefix}ResourcePolicy", value}
      end

      if value = @resource_owner
        params << {"#{prefix}ResourceOwner", value}
      end

      if value = @caller_arn
        params << {"#{prefix}CallerArn", value}
      end

      (@context_entries || [] of ContextEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ContextEntries.member.#{i}."))
      end

      if value = @resource_handling_option
        params << {"#{prefix}ResourceHandlingOption", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_input_list: node.xpath_nodes("*[local-name()='PolicyInputList']/*[local-name()='member']").map { |n| n.content },
        permissions_boundary_policy_input_list: node.xpath_nodes("*[local-name()='PermissionsBoundaryPolicyInputList']/*[local-name()='member']").map { |n| n.content },
        ordered_organization_policy_input_list: node.xpath_nodes("*[local-name()='OrderedOrganizationPolicyInputList']/*[local-name()='member']").map { |n| OrderedOrganizationPolicyType.from_xml(n) },
        action_names: node.xpath_nodes("*[local-name()='ActionNames']/*[local-name()='member']").map { |n| n.content },
        resource_arns: node.xpath_nodes("*[local-name()='ResourceArns']/*[local-name()='member']").map { |n| n.content },
        resource_policy: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourcePolicy']")),
        resource_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceOwner']")),
        caller_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='CallerArn']")),
        context_entries: node.xpath_nodes("*[local-name()='ContextEntries']/*[local-name()='member']").map { |n| ContextEntry.from_xml(n) },
        resource_handling_option: Core::XMLValue.string(node.xpath_node("*[local-name()='ResourceHandlingOption']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
      )
    end
  end
end
