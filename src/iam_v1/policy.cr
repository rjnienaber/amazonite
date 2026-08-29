private alias Core = Amazonite::Core

module Amazonite::IamV1
  class Policy
    property policy_name : String | Nil

    property policy_id : String | Nil

    property arn : String | Nil

    property path : String | Nil

    property default_version_id : String | Nil

    property attachment_count : Int32 | Nil

    property permissions_boundary_usage_count : Int32 | Nil

    property is_attachable : Bool | Nil

    property description : String | Nil

    property create_date : Time | Nil

    property update_date : Time | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @policy_id : String | Nil = nil,
      @arn : String | Nil = nil,
      @path : String | Nil = nil,
      @default_version_id : String | Nil = nil,
      @attachment_count : Int32 | Nil = nil,
      @permissions_boundary_usage_count : Int32 | Nil = nil,
      @is_attachable : Bool | Nil = nil,
      @description : String | Nil = nil,
      @create_date : Time | Nil = nil,
      @update_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @policy_name
        params << {"#{prefix}PolicyName", value}
      end

      if value = @policy_id
        params << {"#{prefix}PolicyId", value}
      end

      if value = @arn
        params << {"#{prefix}Arn", value}
      end

      if value = @path
        params << {"#{prefix}Path", value}
      end

      if value = @default_version_id
        params << {"#{prefix}DefaultVersionId", value}
      end

      if value = @attachment_count
        params << {"#{prefix}AttachmentCount", value.to_s}
      end

      if value = @permissions_boundary_usage_count
        params << {"#{prefix}PermissionsBoundaryUsageCount", value.to_s}
      end

      if value = @is_attachable
        params << {"#{prefix}IsAttachable", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end

      if value = @update_date
        params << {"#{prefix}UpdateDate", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        policy_name: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyName']")),
        policy_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PolicyId']")),
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")),
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        default_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DefaultVersionId']")),
        attachment_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='AttachmentCount']")),
        permissions_boundary_usage_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='PermissionsBoundaryUsageCount']")),
        is_attachable: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsAttachable']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
        update_date: Core::XMLValue.time(node.xpath_node("*[local-name()='UpdateDate']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
