private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TargetStorageTier
    Archive

    def self.to_json(e : TargetStorageTier, json : JSON::Builder) : Nil
      value = case e
              when AEC::TargetStorageTier::Archive then "archive"
              else
                raise Exception.new("unknown enum value for 'TargetStorageTier' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TargetStorageTier
      value = pull.read_string
      case value
      when "archive" then AEC::TargetStorageTier::Archive
      else
        raise Exception.new("unknown enum value for 'TargetStorageTier' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TargetStorageTier::Archive then "archive"
      else
        raise Exception.new("unknown enum value for 'TargetStorageTier' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TargetStorageTier?
      case key
      when "archive" then AEC::TargetStorageTier::Archive
      else
        nil
      end
    end
  end
end
