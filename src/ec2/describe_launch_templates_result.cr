private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLaunchTemplatesResult
    # Information about the launch templates.
    property launch_templates : Array(LaunchTemplate) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @launch_templates : Array(LaunchTemplate) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@launch_templates || [] of LaunchTemplate).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchTemplates.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_templates: node.xpath_nodes("*[local-name()='launchTemplates']/*[local-name()='item']").map { |n| LaunchTemplate.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @launch_templates
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@launch_templates, @next_token)
  end
end
