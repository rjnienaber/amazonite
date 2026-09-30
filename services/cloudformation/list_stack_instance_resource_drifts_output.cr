private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class ListStackInstanceResourceDriftsOutput
    # A list of `StackInstanceResourceDriftsSummary` structures that contain information about the
    # specified stack instances.
    property summaries : Array(StackInstanceResourceDriftsSummary) | Nil

    # If the previous paginated request didn't return all of the remaining results, the response
    # object's `NextToken` parameter value is set to a token. To retrieve the next set of results,
    # call this action again and assign that token to the request object's `NextToken` parameter. If
    # there are no remaining results, the previous response object's `NextToken` parameter is set to
    # `null`.
    property next_token : String | Nil

    def initialize(
      @summaries : Array(StackInstanceResourceDriftsSummary) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@summaries || [] of StackInstanceResourceDriftsSummary).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Summaries.member.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        summaries: node.xpath_nodes("*[local-name()='Summaries']/*[local-name()='member']").map { |n| StackInstanceResourceDriftsSummary.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='NextToken']")),
      )
    end

    def validate! : Nil
      if value = @summaries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@summaries, @next_token)
  end
end
