private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DiskType
    Hdd
    Ssd

    def self.to_json(e : DiskType, json : JSON::Builder) : Nil
      value = case e
              when AEC::DiskType::Hdd then "hdd"
              when AEC::DiskType::Ssd then "ssd"
              else
                raise Exception.new("unknown enum value for 'DiskType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DiskType
      value = pull.read_string
      case value
      when "hdd" then AEC::DiskType::Hdd
      when "ssd" then AEC::DiskType::Ssd
      else
        raise Exception.new("unknown enum value for 'DiskType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DiskType::Hdd then "hdd"
      when AEC::DiskType::Ssd then "ssd"
      else
        raise Exception.new("unknown enum value for 'DiskType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DiskType?
      case key
      when "hdd" then AEC::DiskType::Hdd
      when "ssd" then AEC::DiskType::Ssd
      else
        nil
      end
    end
  end
end
