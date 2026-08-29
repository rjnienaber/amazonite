private alias Core = Amazonite::Core

module Amazonite::IamV1
  class GetAccessKeyLastUsedResponse
    property user_name : String | Nil

    property access_key_last_used : AccessKeyLastUsed | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @access_key_last_used : AccessKeyLastUsed | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @access_key_last_used
        params.concat(value.to_query_params("#{prefix}AccessKeyLastUsed."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        access_key_last_used: node.xpath_node("*[local-name()='AccessKeyLastUsed']").try { |n| AccessKeyLastUsed.from_xml(n) },
      )
    end
  end
end
