private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListExportsOutput
    # The output for the ListExports action.
    property exports : Array(Export) | Nil

    # If the output exceeds 100 exported output values, a string that identifies the next page of
    # exports. If there is no additional page, this value is null.
    property next_token : String | Nil

    def initialize(
      @exports : Array(Export) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@exports || [] of Export).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Exports.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        exports: node.xpath_nodes("*[local-name()='Exports']/*[local-name()='member']").map { |n| Export.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @exports
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@exports, @next_token)
  end
end
