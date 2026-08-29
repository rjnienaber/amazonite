private alias Core = Amazonite::Core

module Amazonite::IamV1
  class InstanceProfile
    property path : String

    property instance_profile_name : String

    property instance_profile_id : String

    property arn : String

    property create_date : Time

    property roles : Array(Role) = [] of Role

    property tags : Array(Tag) | Nil

    def initialize(
      @path : String,
      @instance_profile_name : String,
      @instance_profile_id : String,
      @arn : String,
      @create_date : Time,
      @roles : Array(Role),
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}InstanceProfileName", @instance_profile_name}

      params << {"#{prefix}InstanceProfileId", @instance_profile_id}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}

      @roles.each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Roles.member.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        instance_profile_name: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceProfileName']")).not_nil!,
        instance_profile_id: Core::XMLValue.string(node.xpath_node("*[local-name()='InstanceProfileId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
        roles: node.xpath_nodes("*[local-name()='Roles']/*[local-name()='member']").map { |n| Role.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
