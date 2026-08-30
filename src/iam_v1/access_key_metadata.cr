private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an Amazon Web Services access key, without its secret key.
  #
  # This data type is used as a response element in the
  # [ListAccessKeys](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccessKeys.html)
  # operation.
  class AccessKeyMetadata
    # The name of the IAM user that the key is associated with.
    property user_name : String | Nil

    # The ID for this access key.
    property access_key_id : String | Nil

    # The status of the access key. `Active` means that the key is valid for API calls; `Inactive`
    # means it is not.
    property status : StatusType | Nil

    # The date when the access key was created.
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

    def_equals_and_hash(@user_name, @access_key_id, @status, @create_date)
  end
end
