private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the meta data tags associated with a transit gateway policy rule.
  class TransitGatewayPolicyRuleMetaData
    # The key name for the transit gateway policy rule meta data tag.
    property meta_data_key : String | Nil

    # The value of the key for the transit gateway policy rule meta data tag.
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
        meta_data_key: Core::XMLValue.string(node.xpath_node("*[local-name()='metaDataKey']")),
        meta_data_value: Core::XMLValue.string(node.xpath_node("*[local-name()='metaDataValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@meta_data_key, @meta_data_value)
  end
end
