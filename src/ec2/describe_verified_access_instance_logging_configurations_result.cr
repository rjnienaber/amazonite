private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVerifiedAccessInstanceLoggingConfigurationsResult
    # The logging configuration for the Verified Access instances.
    property logging_configurations : Array(VerifiedAccessInstanceLoggingConfiguration) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @logging_configurations : Array(VerifiedAccessInstanceLoggingConfiguration) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@logging_configurations || [] of VerifiedAccessInstanceLoggingConfiguration).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LoggingConfigurationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        logging_configurations: node.xpath_nodes("*[local-name()='loggingConfigurationSet']/*[local-name()='item']").map { |n| VerifiedAccessInstanceLoggingConfiguration.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @logging_configurations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@logging_configurations, @next_token)
  end
end
