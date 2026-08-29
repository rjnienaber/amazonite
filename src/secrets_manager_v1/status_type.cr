private alias ASM = Amazonite::SecretsManagerV1

module Amazonite::SecretsManagerV1
  enum StatusType
    InSync
    Failed
    InProgress

    def self.to_json(e : StatusType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ASM::StatusType
      value = pull.read_string
      case value
      when "InSync"     then ASM::StatusType::InSync
      when "Failed"     then ASM::StatusType::Failed
      when "InProgress" then ASM::StatusType::InProgress
      else
        raise Exception.new("unknown enum value for 'StatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ASM::StatusType?
      case key
      when "InSync"     then ASM::StatusType::InSync
      when "Failed"     then ASM::StatusType::Failed
      when "InProgress" then ASM::StatusType::InProgress
      else
        nil
      end
    end
  end
end
