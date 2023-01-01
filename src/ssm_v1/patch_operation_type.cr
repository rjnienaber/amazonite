private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PatchOperationType
    Scan
    Install

    def self.to_json(e : PatchOperationType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PatchOperationType
      value = pull.read_string
      case value
      when "Scan"    then AS::PatchOperationType::Scan
      when "Install" then AS::PatchOperationType::Install
      else
        raise Exception.new("unknown enum value for 'PatchOperationType' when deserializing from json: '#{value}'")
      end
    end
  end
end
