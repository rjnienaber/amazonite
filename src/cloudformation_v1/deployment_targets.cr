private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class DeploymentTargets
    property accounts : Array(String) | Nil

    property accounts_url : String | Nil

    property organizational_unit_ids : Array(String) | Nil

    property account_filter_type : AccountFilterType | Nil

    def initialize(
      @accounts : Array(String) | Nil = nil,
      @accounts_url : String | Nil = nil,
      @organizational_unit_ids : Array(String) | Nil = nil,
      @account_filter_type : AccountFilterType | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@accounts || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Accounts.member.#{i}", item}
      end

      if value = @accounts_url
        params << {"#{prefix}AccountsUrl", value}
      end

      (@organizational_unit_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}OrganizationalUnitIds.member.#{i}", item}
      end

      if value = @account_filter_type
        params << {"#{prefix}AccountFilterType", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        accounts: node.xpath_nodes("*[local-name()='Accounts']/*[local-name()='member']").map { |n| n.content },
        accounts_url: Core::XMLValue.string(node.xpath_node("*[local-name()='AccountsUrl']")),
        organizational_unit_ids: node.xpath_nodes("*[local-name()='OrganizationalUnitIds']/*[local-name()='member']").map { |n| n.content },
        account_filter_type: (n = node.xpath_node("*[local-name()='AccountFilterType']")) ? ACF::AccountFilterType.from_json_object_key?(n.content) : nil,
      )
    end
  end
end
