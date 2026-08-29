private alias AS = Amazonite::SnsV1

module Amazonite::SnsV1
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
