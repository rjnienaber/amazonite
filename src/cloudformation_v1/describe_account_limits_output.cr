private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  # The output for the DescribeAccountLimits action.
  class DescribeAccountLimitsOutput
    # An account limit structure that contain a list of CloudFormation account limits and their
    # values.
    property account_limits : Array(AccountLimit) | Nil

    # If the output exceeds 1 MB in size, a string that identifies the next page of limits. If no
    # additional page exists, this value is null.
    property next_token : String | Nil

    def initialize(
      @account_limits : Array(AccountLimit) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@account_limits || [] of AccountLimit).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AccountLimits.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_limits: node.xpath_nodes("*[local-name()='AccountLimits']/*[local-name()='member']").map { |n| AccountLimit.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end
  end
end
