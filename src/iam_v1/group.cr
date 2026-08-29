private alias Core = Amazonite::Core

module Amazonite::IamV1
  class Group
    property path : String

    property group_name : String

    property group_id : String

    property arn : String

    property create_date : Time

    def initialize(
      @path : String,
      @group_name : String,
      @group_id : String,
      @arn : String,
      @create_date : Time,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Path", @path}

      params << {"#{prefix}GroupName", @group_name}

      params << {"#{prefix}GroupId", @group_id}

      params << {"#{prefix}Arn", @arn}

      params << {"#{prefix}CreateDate", Core::QueryValue.time(@create_date)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")).not_nil!,
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupName']")).not_nil!,
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupId']")).not_nil!,
        arn: Core::XMLValue.string(node.xpath_node("*[local-name()='Arn']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")).not_nil!,
      )
    end
  end
end
