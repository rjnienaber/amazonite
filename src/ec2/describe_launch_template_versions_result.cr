private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeLaunchTemplateVersionsResult
    # Information about the launch template versions.
    property launch_template_versions : Array(LaunchTemplateVersion) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @launch_template_versions : Array(LaunchTemplateVersion) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@launch_template_versions || [] of LaunchTemplateVersion).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}LaunchTemplateVersionSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_versions: node.xpath_nodes("*[local-name()='launchTemplateVersionSet']/*[local-name()='item']").map { |n| LaunchTemplateVersion.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @launch_template_versions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@launch_template_versions, @next_token)
  end
end
