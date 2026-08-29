module Amazonite::SnsV1
  # The input for the `GetSMSAttributes` request.
  class GetSMSAttributesInput
    # A list of the individual attribute names, such as `MonthlySpendLimit`, for which you want
    # values.
    #
    # For all attribute names, see
    # [SetSMSAttributes](https://docs.aws.amazon.com/sns/latest/api/API_SetSMSAttributes.html).
    #
    # If you don't use this parameter, Amazon SNS returns all SMS attributes.
    property attributes : Array(String) | Nil

    def initialize(
      @attributes : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@attributes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}attributes.member.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        attributes: node.xpath_nodes("*[local-name()='attributes']/*[local-name()='member']").map { |n| n.content },
      )
    end
  end
end
