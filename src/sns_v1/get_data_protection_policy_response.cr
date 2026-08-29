private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class GetDataProtectionPolicyResponse
    property data_protection_policy : String | Nil

    def initialize(
      @data_protection_policy : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @data_protection_policy
        params << {"#{prefix}DataProtectionPolicy", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        data_protection_policy: Core::XMLValue.string(node.xpath_node("*[local-name()='DataProtectionPolicy']")),
      )
    end
  end
end
