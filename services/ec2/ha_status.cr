private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HaStatus
    Processing
    Active
    Standby
    Invalid

    def self.to_json(e : HaStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::HaStatus::Processing then "processing"
              when AEC::HaStatus::Active     then "active"
              when AEC::HaStatus::Standby    then "standby"
              when AEC::HaStatus::Invalid    then "invalid"
              else
                raise Exception.new("unknown enum value for 'HaStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HaStatus
      value = pull.read_string
      case value
      when "processing" then AEC::HaStatus::Processing
      when "active"     then AEC::HaStatus::Active
      when "standby"    then AEC::HaStatus::Standby
      when "invalid"    then AEC::HaStatus::Invalid
      else
        raise Exception.new("unknown enum value for 'HaStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HaStatus::Processing then "processing"
      when AEC::HaStatus::Active     then "active"
      when AEC::HaStatus::Standby    then "standby"
      when AEC::HaStatus::Invalid    then "invalid"
      else
        raise Exception.new("unknown enum value for 'HaStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HaStatus?
      case key
      when "processing" then AEC::HaStatus::Processing
      when "active"     then AEC::HaStatus::Active
      when "standby"    then AEC::HaStatus::Standby
      when "invalid"    then AEC::HaStatus::Invalid
      else
        nil
      end
    end
  end
end
