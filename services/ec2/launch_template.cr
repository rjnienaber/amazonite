private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a launch template.
  class LaunchTemplate
    # The ID of the launch template.
    property launch_template_id : String | Nil

    # The name of the launch template.
    property launch_template_name : String | Nil

    # The time launch template was created.
    property create_time : Time | Nil

    # The principal that created the launch template.
    property created_by : String | Nil

    # The version number of the default version of the launch template.
    property default_version_number : Int64 | Nil

    # The version number of the latest version of the launch template.
    property latest_version_number : Int64 | Nil

    # The tags for the launch template.
    property tags : Array(Tag) | Nil

    # The entity that manages the launch template.
    property operator : OperatorResponse | Nil

    def initialize(
      @launch_template_id : String | Nil = nil,
      @launch_template_name : String | Nil = nil,
      @create_time : Time | Nil = nil,
      @created_by : String | Nil = nil,
      @default_version_number : Int64 | Nil = nil,
      @latest_version_number : Int64 | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
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

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @created_by
        params << {"#{prefix}CreatedBy", value}
      end

      if value = @default_version_number
        params << {"#{prefix}DefaultVersionNumber", value.to_s}
      end

      if value = @latest_version_number
        params << {"#{prefix}LatestVersionNumber", value.to_s}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
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
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        created_by: Core::XMLValue.string(node.xpath_node("*[local-name()='createdBy']")),
        default_version_number: Core::XMLValue.i64(node.xpath_node("*[local-name()='defaultVersionNumber']")),
        latest_version_number: Core::XMLValue.i64(node.xpath_node("*[local-name()='latestVersionNumber']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @launch_template_name
        raise Core::ValidationError.new("LaunchTemplateName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("LaunchTemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("LaunchTemplateName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\(\\)\\.\\-/_]+$"))
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@launch_template_id, @launch_template_name, @create_time, @created_by, @default_version_number, @latest_version_number, @tags, @operator)
  end
end
