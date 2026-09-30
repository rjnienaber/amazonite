module Amazonite::Iam
  class PutAccountPropertiesRequest
    # A map of property key-value pairs to set. All keys must belong to the same namespace.
    #
    # Each key uses the format `Namespace/PropertyName`. The key must contain exactly one `/`
    # separating the namespace from the property name, and cannot start or end with `/`.
    #
    # The service validates each value based on the property key's expected type. For example, boolean
    # properties expect `true` or `false`.
    property properties : Hash(String, String)

    def initialize(
      @properties : Hash(String, String),
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      @properties.each_with_index(1) do |(key, value), i|
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

    def validate! : Nil
    end

    def_equals_and_hash(@properties)
  end
end
