private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class ListTypeRegistrationsOutput
    # A list of extension registration tokens.
    #
    # Use DescribeTypeRegistration to return detailed information about a type registration request.
    property registration_token_list : Array(String) | Nil

    # If the request doesn't return all the remaining results, `NextToken` is set to a token. To
    # retrieve the next set of results, call this action again and assign that token to the request
    # object's `NextToken` parameter. If the request returns all results, `NextToken` is set to
    # `null`.
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

    def_equals_and_hash(@registration_token_list, @next_token)
  end
end
