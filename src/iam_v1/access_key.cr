private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  class AccessKey
    property user_name : String

    property access_key_id : String

    property status : StatusType

    property secret_access_key : String

    property create_date : Time | Nil

    def initialize(
      @user_name : String,
      @access_key_id : String,
      @status : StatusType,
      @secret_access_key : String,
      @create_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}AccessKeyId", @access_key_id}

      params << {"#{prefix}Status", @status.to_json_object_key}

      params << {"#{prefix}SecretAccessKey", @secret_access_key}

      if value = @create_date
        params << {"#{prefix}CreateDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        access_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessKeyId']")).not_nil!,
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil.not_nil!,
        secret_access_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SecretAccessKey']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
      )
    end
  end
end
