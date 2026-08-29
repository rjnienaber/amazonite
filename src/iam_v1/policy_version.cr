private alias Core = Amazonite::Core

module Amazonite::IamV1
  class PolicyVersion
    property document : String | Nil

    property version_id : String | Nil

    property is_default_version : Bool | Nil

    property create_date : Time | Nil

    def initialize(
      @document : String | Nil = nil,
      @version_id : String | Nil = nil,
      @is_default_version : Bool | Nil = nil,
      @create_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @document
        params << {"#{prefix}Document", value}
      end

      if value = @version_id
        params << {"#{prefix}VersionId", value}
      end

      if value = @is_default_version
        params << {"#{prefix}IsDefaultVersion", Core::QueryValue.bool(value)}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        document: Core::XMLValue.string(node.xpath_node("*[local-name()='Document']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        is_default_version: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsDefaultVersion']")),
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
      )
    end
  end
end
