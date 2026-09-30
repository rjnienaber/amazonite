private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SnapshotLocationEnum
    Regional
    Local

    def self.to_json(e : SnapshotLocationEnum, json : JSON::Builder) : Nil
      value = case e
              when AEC::SnapshotLocationEnum::Regional then "regional"
              when AEC::SnapshotLocationEnum::Local    then "local"
              else
                raise Exception.new("unknown enum value for 'SnapshotLocationEnum' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SnapshotLocationEnum
      value = pull.read_string
      case value
      when "regional" then AEC::SnapshotLocationEnum::Regional
      when "local"    then AEC::SnapshotLocationEnum::Local
      else
        raise Exception.new("unknown enum value for 'SnapshotLocationEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SnapshotLocationEnum::Regional then "regional"
      when AEC::SnapshotLocationEnum::Local    then "local"
      else
        raise Exception.new("unknown enum value for 'SnapshotLocationEnum' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SnapshotLocationEnum?
      case key
      when "regional" then AEC::SnapshotLocationEnum::Regional
      when "local"    then AEC::SnapshotLocationEnum::Local
      else
        nil
      end
    end
  end
end
