private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeRegistrationsOutput
    property registration_token_list : Array(String) | Nil

    property next_token : String | Nil

    def initialize(
      @registration_token_list : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@registration_token_list || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RegistrationTokenList.member.#{i}", item}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        registration_token_list: node.xpath_nodes("*[local-name()='RegistrationTokenList']/*[local-name()='member']").map { |n| n.content },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
