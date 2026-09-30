private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeApplicationStatusResult
    # The application statuses for the specified instances.
    property application_statuses : ApplicationStatusesResponseType | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @application_statuses : ApplicationStatusesResponseType | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @application_statuses
        params.concat(value.to_query_params("#{prefix}ApplicationStatusesResponseType."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_statuses: node.xpath_node("*[local-name()='applicationStatusesResponseType']").try { |n| ApplicationStatusesResponseType.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @application_statuses
        value.validate!
      end
    end

    def_equals_and_hash(@application_statuses, @next_token)
  end
end
