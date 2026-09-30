private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeAccountAttributesResult
    # Information about the account attributes.
    property account_attributes : Array(AccountAttribute) | Nil

    def initialize(
      @account_attributes : Array(AccountAttribute) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@account_attributes || [] of AccountAttribute).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AccountAttributeSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        account_attributes: node.xpath_nodes("*[local-name()='accountAttributeSet']/*[local-name()='item']").map { |n| AccountAttribute.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @account_attributes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@account_attributes)
  end
end
