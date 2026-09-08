private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes prefixes for Amazon Web Services services.
  class PrefixList
    # The IP address range of the Amazon Web Services service.
    property cidrs : Array(String) | Nil

    # The ID of the prefix.
    property prefix_list_id : String | Nil

    # The name of the prefix.
    property prefix_list_name : String | Nil

    def initialize(
      @cidrs : Array(String) | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @prefix_list_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@cidrs || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}CidrSet.#{i}", item}
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @prefix_list_name
        params << {"#{prefix}PrefixListName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidrs: node.xpath_nodes("*[local-name()='cidrSet']/*[local-name()='item']").map { |n| n.content },
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        prefix_list_name: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListName']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidrs, @prefix_list_id, @prefix_list_name)
  end
end
