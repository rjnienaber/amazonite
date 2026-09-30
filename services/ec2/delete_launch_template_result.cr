private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteLaunchTemplateResult
    # Information about the launch template.
    property launch_template : LaunchTemplate | Nil

    def initialize(
      @launch_template : LaunchTemplate | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template
        params.concat(value.to_query_params("#{prefix}LaunchTemplate."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template: node.xpath_node("*[local-name()='launchTemplate']").try { |n| LaunchTemplate.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template)
  end
end
