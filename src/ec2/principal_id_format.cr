private alias Core = Amazonite::Core

module Amazonite::EC2
  # PrincipalIdFormat description
  class PrincipalIdFormat
    # PrincipalIdFormatARN description
    property arn : String | Nil

    # PrincipalIdFormatStatuses description
    property statuses : Array(IdFormat) | Nil

    def initialize(
      @arn : String | Nil = nil,
      @statuses : Array(IdFormat) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      (@statuses || [] of IdFormat).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}StatusSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='arn']")),
        statuses: node.xpath_nodes("*[local-name()='statusSet']/*[local-name()='item']").map { |n| IdFormat.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @statuses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@arn, @statuses)
  end
end
