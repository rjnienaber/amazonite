private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [GetAccessKeyLastUsed](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetAccessKeyLastUsed.html)
  # request. It is also returned as a member of the
  # [AccessKeyMetaData](https://docs.aws.amazon.com/IAM/latest/APIReference/API_AccessKeyMetaData.html)
  # structure returned by the
  # [ListAccessKeys](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccessKeys.html)
  # action.
  class GetAccessKeyLastUsedResponse
    # The name of the IAM user that owns this access key.
    property user_name : String | Nil

    # Contains information about the last time the access key was used.
    property access_key_last_used : AccessKeyLastUsed | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @access_key_last_used : AccessKeyLastUsed | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @access_key_last_used
        params.concat(value.to_query_params("#{prefix}AccessKeyLastUsed."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        access_key_last_used: node.xpath_node("*[local-name()='AccessKeyLastUsed']").try { |n| AccessKeyLastUsed.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @access_key_last_used
        value.validate!
      end
    end

    def_equals_and_hash(@user_name, @access_key_last_used)
  end
end
