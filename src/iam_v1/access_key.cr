private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an Amazon Web Services access key.
  #
  # This data type is used as a response element in the
  # [CreateAccessKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateAccessKey.html)
  # and
  # [ListAccessKeys](https://docs.aws.amazon.com/IAM/latest/APIReference/API_ListAccessKeys.html)
  # operations.
  #
  # The `SecretAccessKey` value is returned only in response to
  # [CreateAccessKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateAccessKey.html).
  # You can get a secret access key only when you first create an access key; you cannot recover the
  # secret access key later. If you lose a secret access key, you must create a new access key.
  class AccessKey
    # The name of the IAM user that the access key is associated with.
    property user_name : String

    # The ID for this access key.
    property access_key_id : String

    # The status of the access key. `Active` means that the key is valid for API calls, while
    # `Inactive` means it is not.
    property status : StatusType

    # The secret key used to sign requests.
    property secret_access_key : String

    # The date when the access key was created.
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
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil).not_nil!,
        secret_access_key: Core::XMLValue.string(node.xpath_node("*[local-name()='SecretAccessKey']")).not_nil!,
        create_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreateDate']")),
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @access_key_id
        raise Core::ValidationError.new("AccessKeyId length must be >= 16") if value.size < 16
        raise Core::ValidationError.new("AccessKeyId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("AccessKeyId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@user_name, @access_key_id, @status, @secret_access_key, @create_date)
  end
end
