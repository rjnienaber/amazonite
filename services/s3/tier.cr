private alias AS = Amazonite::S3

module Amazonite::S3
  enum Tier
    Standard
    Bulk
    Expedited

    def self.to_json(e : Tier, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Tier
      value = pull.read_string
      case value
      when "Standard"  then AS::Tier::Standard
      when "Bulk"      then AS::Tier::Bulk
      when "Expedited" then AS::Tier::Expedited
      else
        raise Exception.new("unknown enum value for 'Tier' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::Tier?
      case key
      when "Standard"  then AS::Tier::Standard
      when "Bulk"      then AS::Tier::Bulk
      when "Expedited" then AS::Tier::Expedited
      else
        nil
      end
    end
  end
end
