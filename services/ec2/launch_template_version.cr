private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch template version.
  class LaunchTemplateVersion
    # The ID of the launch template.
    property launch_template_id : String | Nil

    # The name of the launch template.
    property launch_template_name : String | Nil

    # The version number.
    property version_number : Int64 | Nil

    # The description for the version.
    property version_description : String | Nil

    # The time the version was created.
    property create_time : Time | Nil

    # The principal that created the version.
    property created_by : String | Nil

    # Indicates whether the version is the default version.
    property default_version : Bool | Nil

    # Information about the launch template.
    property launch_template_data : ResponseLaunchTemplateData | Nil

    # The entity that manages the launch template.
    property operator : OperatorResponse | Nil

    def initialize(
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
      @version_number : Int64 | Nil = nil,
      @version_description : String | Nil = nil,
      @create_time : Time | Nil = nil,
      @created_by : String | Nil = nil,
      @default_version : Bool | Nil = nil,
      @launch_template_data : ResponseLaunchTemplateData | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
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

      if value = @version_description
        params << {"#{prefix}VersionDescription", value}
      end

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @created_by
        params << {"#{prefix}CreatedBy", value}
      end

      if value = @default_version
        params << {"#{prefix}DefaultVersion", Core::QueryValue.bool(value)}
      end

      if value = @launch_template_data
        params.concat(value.to_query_params("#{prefix}LaunchTemplateData."))
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        launch_template_id: Core::XMLValue.string(node.xpath_node("*[local-name()='launchTemplateId']")),
        launch_template_name: Core::XMLValue.string(node.xpath_node("*[local-name()='launchTemplateName']")),
        version_number: Core::XMLValue.i64(node.xpath_node("*[local-name()='versionNumber']")),
        version_description: Core::XMLValue.string(node.xpath_node("*[local-name()='versionDescription']")),
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        created_by: Core::XMLValue.string(node.xpath_node("*[local-name()='createdBy']")),
        default_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='defaultVersion']")),
        launch_template_data: node.xpath_node("*[local-name()='launchTemplateData']").try { |n| ResponseLaunchTemplateData.from_xml(n) },
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template_name
        raise Core::ValidationError.new("LaunchTemplateName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LaunchTemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LaunchTemplateName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\(\\)\\.\\-/_]+$"))
      end

      if value = @version_description
        raise Core::ValidationError.new("VersionDescription length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("VersionDescription length must be <= 255") if value.size > 255
      end

      if value = @launch_template_data
        value.validate!
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_id, @launch_template_name, @version_number, @version_description, @create_time, @created_by, @default_version, @launch_template_data, @operator)
  end
end
