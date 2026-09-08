private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch template version that could not be deleted.
  class DeleteLaunchTemplateVersionsResponseErrorItem
    # The ID of the launch template.
    property launch_template_id : String | Nil

    # The name of the launch template.
    property launch_template_name : String | Nil

    # The version number of the launch template.
    property version_number : Int64 | Nil

    # Information about the error.
    property response_error : ResponseError | Nil

    def initialize(
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
      @version_number : Int64 | Nil = nil,
      @response_error : ResponseError | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @launch_template_id
        params << {"#{prefix}LaunchTemplateId", value}
      end

      if value = @launch_template_name
        params << {"#{prefix}LaunchTemplateName", value}
      end

      if value = @version_number
        params << {"#{prefix}VersionNumber", value.to_s}
      end

      if value = @response_error
        params.concat(value.to_query_params("#{prefix}ResponseError."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='launchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='launchTemplateName']")),
        version_number: Core::XMLValue.i64(node.xpath_node("*[local-name()='versionNumber']")),
        response_error: node.xpath_node("*[local-name()='responseError']").try { |n| ResponseError.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @response_error
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_id, @launch_template_name, @version_number, @response_error)
  end
end
