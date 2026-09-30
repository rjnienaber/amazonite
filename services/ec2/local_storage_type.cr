private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocalStorageType
    Hdd
    Ssd

    def self.to_json(e : LocalStorageType, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocalStorageType::Hdd then "hdd"
              when AEC::LocalStorageType::Ssd then "ssd"
              else
                raise Exception.new("unknown enum value for 'LocalStorageType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocalStorageType
      value = pull.read_string
      case value
      when "hdd" then AEC::LocalStorageType::Hdd
      when "ssd" then AEC::LocalStorageType::Ssd
      else
        raise Exception.new("unknown enum value for 'LocalStorageType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocalStorageType::Hdd then "hdd"
      when AEC::LocalStorageType::Ssd then "ssd"
      else
        raise Exception.new("unknown enum value for 'LocalStorageType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocalStorageType?
      case key
      when "hdd" then AEC::LocalStorageType::Hdd
      when "ssd" then AEC::LocalStorageType::Ssd
      else
        nil
      end
    end
  end
end
