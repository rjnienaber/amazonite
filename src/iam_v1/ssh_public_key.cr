private alias AI = Amazonite::IamV1
private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about an SSH public key.
  #
  # This data type is used as a response element in the
  # [GetSSHPublicKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetSSHPublicKey.html)
  # and
  # [UploadSSHPublicKey](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSSHPublicKey.html)
  # operations.
  class SSHPublicKey
    # The name of the IAM user associated with the SSH public key.
    property user_name : String

    # The unique identifier for the SSH public key.
    property ssh_public_key_id : String

    # The MD5 message digest of the SSH public key.
    property fingerprint : String

    # The SSH public key.
    property ssh_public_key_body : String

    # The status of the SSH public key. `Active` means that the key can be used for authentication
    # with an CodeCommit repository. `Inactive` means that the key cannot be used.
    property status : StatusType

    # The date and time, in [ISO 8601 date-time format](http://www.iso.org/iso/iso8601), when the SSH
    # public key was uploaded.
    property upload_date : Time | Nil

    def initialize(
      @user_name : String,
      @ssh_public_key_id : String,
      @fingerprint : String,
      @ssh_public_key_body : String,
      @status : StatusType,
      @upload_date : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}UserName", @user_name}

      params << {"#{prefix}SSHPublicKeyId", @ssh_public_key_id}

      params << {"#{prefix}Fingerprint", @fingerprint}

      params << {"#{prefix}SSHPublicKeyBody", @ssh_public_key_body}

      params << {"#{prefix}Status", @status.to_json_object_key}

      if value = @upload_date
        params << {"#{prefix}UploadDate", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")).not_nil!,
        ssh_public_key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SSHPublicKeyId']")).not_nil!,
        fingerprint: Core::XMLValue.string(node.xpath_node("*[local-name()='Fingerprint']")).not_nil!,
        ssh_public_key_body: Core::XMLValue.string(node.xpath_node("*[local-name()='SSHPublicKeyBody']")).not_nil!,
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AI::StatusType.from_json_object_key?(n.content) : nil).not_nil!,
        upload_date: Core::XMLValue.time(node.xpath_node("*[local-name()='UploadDate']")),
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @ssh_public_key_id
        raise Core::ValidationError.new("SSHPublicKeyId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("SSHPublicKeyId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("SSHPublicKeyId does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end

      if value = @fingerprint
        raise Core::ValidationError.new("Fingerprint length must be >= 48") if value.size < 48
        raise Core::ValidationError.new("Fingerprint length must be <= 48") if value.size > 48
        raise Core::ValidationError.new("Fingerprint does not match the required pattern") unless value.matches?(Regex.new("^[:\\w]+$"))
      end

      if value = @ssh_public_key_body
        raise Core::ValidationError.new("SSHPublicKeyBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SSHPublicKeyBody length must be <= 16384") if value.size > 16384
        raise Core::ValidationError.new("SSHPublicKeyBody does not match the required pattern") unless value.matches?(Regex.new("^[\\u0009\\u000A\\u000D\\u0020-\\u00FF]+$"))
      end
    end

    def_equals_and_hash(@user_name, @ssh_public_key_id, @fingerprint, @ssh_public_key_body, @status, @upload_date)
  end
end
