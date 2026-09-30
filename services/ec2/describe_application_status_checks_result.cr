private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeApplicationStatusChecksResult
    # Information about the application status checks.
    property application_status_checks : Array(ApplicationStatusCheckResponseObject) | Nil

    # The token to include in another request to get the next page of items. This value is `null` when
    # there are no more items to return.
    property next_token : String | Nil

    def initialize(
      @application_status_checks : Array(ApplicationStatusCheckResponseObject) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@application_status_checks || [] of ApplicationStatusCheckResponseObject).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ApplicationStatusCheckSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        application_status_checks: node.xpath_nodes("*[local-name()='applicationStatusCheckSet']/*[local-name()='item']").map { |n| ApplicationStatusCheckResponseObject.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @application_status_checks
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@application_status_checks, @next_token)
  end
end
