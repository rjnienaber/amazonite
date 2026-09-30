private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteManagedPrefixListResult
    # Information about the prefix list.
    property prefix_list : ManagedPrefixList | Nil

    def initialize(
      @prefix_list : ManagedPrefixList | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @prefix_list
        params.concat(value.to_query_params("#{prefix}PrefixList."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix_list: node.xpath_node("*[local-name()='prefixList']").try { |n| ManagedPrefixList.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @prefix_list
        value.validate!
      end
    end

    def_equals_and_hash(@prefix_list)
  end
end
