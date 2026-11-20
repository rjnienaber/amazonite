private alias AS = Amazonite::S3

module Amazonite::S3
  enum UseSourceMultiRegionKeyStatus
    Enabled
    Disabled

    def self.to_json(e : UseSourceMultiRegionKeyStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::UseSourceMultiRegionKeyStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::UseSourceMultiRegionKeyStatus::Enabled
      when "Disabled" then AS::UseSourceMultiRegionKeyStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'UseSourceMultiRegionKeyStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::UseSourceMultiRegionKeyStatus?
      case key
      when "Enabled"  then AS::UseSourceMultiRegionKeyStatus::Enabled
      when "Disabled" then AS::UseSourceMultiRegionKeyStatus::Disabled
      else
        nil
      end
    end
  end
end
