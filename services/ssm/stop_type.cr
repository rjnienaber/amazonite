private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum StopType
    Complete
    Cancel

    def self.to_json(e : StopType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::StopType
      value = pull.read_string
      case value
      when "Complete" then AS::StopType::Complete
      when "Cancel"   then AS::StopType::Cancel
      else
        raise Exception.new("unknown enum value for 'StopType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::StopType?
      case key
      when "Complete" then AS::StopType::Complete
      when "Cancel"   then AS::StopType::Cancel
      else
        nil
      end
    end
  end
end
