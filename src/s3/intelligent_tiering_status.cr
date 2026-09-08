private alias AS = Amazonite::S3

module Amazonite::S3
  enum IntelligentTieringStatus
    Enabled
    Disabled

    def self.to_json(e : IntelligentTieringStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::IntelligentTieringStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::IntelligentTieringStatus::Enabled
      when "Disabled" then AS::IntelligentTieringStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'IntelligentTieringStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::IntelligentTieringStatus?
      case key
      when "Enabled"  then AS::IntelligentTieringStatus::Enabled
      when "Disabled" then AS::IntelligentTieringStatus::Disabled
      else
        nil
      end
    end
  end
end
