private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum StorageTier
    Archive
    Standard

    def self.to_json(e : StorageTier, json : JSON::Builder) : Nil
      value = case e
              when AEC::StorageTier::Archive  then "archive"
              when AEC::StorageTier::Standard then "standard"
              else
                raise Exception.new("unknown enum value for 'StorageTier' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::StorageTier
      value = pull.read_string
      case value
      when "archive"  then AEC::StorageTier::Archive
      when "standard" then AEC::StorageTier::Standard
      else
        raise Exception.new("unknown enum value for 'StorageTier' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::StorageTier::Archive  then "archive"
      when AEC::StorageTier::Standard then "standard"
      else
        raise Exception.new("unknown enum value for 'StorageTier' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::StorageTier?
      case key
      when "archive"  then AEC::StorageTier::Archive
      when "standard" then AEC::StorageTier::Standard
      else
        nil
      end
    end
  end
end
