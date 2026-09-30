private alias Core = Amazonite::Core

module Amazonite::EC2
  # A metadata key-value pair for a transit gateway policy rule.
  class TransitGatewayRequestPolicyRuleMetaData
    # The key of the metadata pair for the policy rule.
    property meta_data_key : String | Nil

    # The value of the metadata pair for the policy rule.
    property meta_data_value : String | Nil

    def initialize(
      @meta_data_key : String | Nil = nil,
      @meta_data_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @meta_data_key
        params << {"#{prefix}MetaDataKey", value}
      end

      if value = @meta_data_value
        params << {"#{prefix}MetaDataValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        meta_data_key: Core::XMLValue.string(node.xpath_node("*[local-name()='MetaDataKey']")),
        meta_data_value: Core::XMLValue.string(node.xpath_node("*[local-name()='MetaDataValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@meta_data_key, @meta_data_value)
  end
end
