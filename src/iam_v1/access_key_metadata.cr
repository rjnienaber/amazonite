private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AccessKeyMetadata
    property user_name : String | Nil

    property access_key_id : String | Nil

    property status : StatusType | Nil

    property create_date : Time | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @access_key_id : String | Nil = nil,
      @status : StatusType | Nil = nil,
      @create_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @access_key_id
        params << {"#{prefix}AccessKeyId", value}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")),
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
      )
    end
  end
end
