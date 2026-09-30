private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FastLaunchResourceType
    Snapshot

    def self.to_json(e : FastLaunchResourceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::FastLaunchResourceType::Snapshot then "snapshot"
              else
                raise Exception.new("unknown enum value for 'FastLaunchResourceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FastLaunchResourceType
      value = pull.read_string
      case value
      when "snapshot" then AEC::FastLaunchResourceType::Snapshot
      else
        raise Exception.new("unknown enum value for 'FastLaunchResourceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FastLaunchResourceType::Snapshot then "snapshot"
      else
        raise Exception.new("unknown enum value for 'FastLaunchResourceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FastLaunchResourceType?
      case key
      when "snapshot" then AEC::FastLaunchResourceType::Snapshot
      else
        nil
      end
    end
  end
end
