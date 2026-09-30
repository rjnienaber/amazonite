private alias AS = Amazonite::Sns

module Amazonite::Sns
  # Enum listing out all supported destination phone number verification statuses. The following
  # enum values are supported. 1. PENDING : The destination phone number is pending verification. 2.
  # VERIFIED : The destination phone number is verified.
  enum SMSSandboxPhoneNumberVerificationStatus
    Pending
    Verified

    def self.to_json(e : SMSSandboxPhoneNumberVerificationStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::SMSSandboxPhoneNumberVerificationStatus
      value = pull.read_string
      case value
      when "Pending"  then AS::SMSSandboxPhoneNumberVerificationStatus::Pending
      when "Verified" then AS::SMSSandboxPhoneNumberVerificationStatus::Verified
      else
        raise Exception.new("unknown enum value for 'SMSSandboxPhoneNumberVerificationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::SMSSandboxPhoneNumberVerificationStatus?
      case key
      when "Pending"  then AS::SMSSandboxPhoneNumberVerificationStatus::Pending
      when "Verified" then AS::SMSSandboxPhoneNumberVerificationStatus::Verified
      else
        nil
      end
    end
  end
end
