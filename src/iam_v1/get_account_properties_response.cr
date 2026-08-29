module Amazonite::IamV1
  class GetAccountPropertiesResponse
    # A map of account property key-value pairs. Keys are in the format `Namespace/PropertyName`.
    property properties : Hash(String, String) | Nil

    def initialize(
      @properties : Hash(String, String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@properties || {} of String => String).each_with_index(1) do |(key, value), i|
        params << {"#{prefix}Properties.entry.#{i}.key", key}
        params << {"#{prefix}Properties.entry.#{i}.value", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        properties: node.xpath_nodes("*[local-name()='Properties']/*[local-name()='entry']").each_with_object({} of String => String) { |entry, hash| hash[entry.xpath_node("*[local-name()='key']").not_nil!.content] = entry.xpath_node("*[local-name()='value']").not_nil!.content },
      )
    end
  end
end
