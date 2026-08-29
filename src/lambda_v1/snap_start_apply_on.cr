private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum SnapStartApplyOn
    PublishedVersions
    None

    def self.to_json(e : SnapStartApplyOn, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::SnapStartApplyOn
      value = pull.read_string
      case value
      when "PublishedVersions" then AL::SnapStartApplyOn::PublishedVersions
      when "None"              then AL::SnapStartApplyOn::None
      else
        raise Exception.new("unknown enum value for 'SnapStartApplyOn' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::SnapStartApplyOn?
      case key
      when "PublishedVersions" then AL::SnapStartApplyOn::PublishedVersions
      when "None"              then AL::SnapStartApplyOn::None
      else
        nil
      end
    end
  end
end
