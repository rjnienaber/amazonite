private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetLaunchTemplateDataResult
    # The instance data.
    property launch_template_data : ResponseLaunchTemplateData | Nil

    def initialize(
      @launch_template_data : ResponseLaunchTemplateData | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_data
        params.concat(value.to_query_params("#{prefix}LaunchTemplateData."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_data: node.xpath_node("*[local-name()='launchTemplateData']").try { |n| ResponseLaunchTemplateData.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template_data
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_data)
  end
end
