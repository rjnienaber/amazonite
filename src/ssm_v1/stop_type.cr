private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
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
  end
end
