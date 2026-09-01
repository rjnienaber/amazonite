private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum DeprecatedStatus
    Live
    Deprecated

    def self.to_json(e : DeprecatedStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::DeprecatedStatus::Live       then "LIVE"
              when ACF::DeprecatedStatus::Deprecated then "DEPRECATED"
              else
                raise Exception.new("unknown enum value for 'DeprecatedStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::DeprecatedStatus
      value = pull.read_string
      case value
      when "LIVE"       then ACF::DeprecatedStatus::Live
      when "DEPRECATED" then ACF::DeprecatedStatus::Deprecated
      else
        raise Exception.new("unknown enum value for 'DeprecatedStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::DeprecatedStatus::Live       then "LIVE"
      when ACF::DeprecatedStatus::Deprecated then "DEPRECATED"
      else
        raise Exception.new("unknown enum value for 'DeprecatedStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::DeprecatedStatus?
      case key
      when "LIVE"       then ACF::DeprecatedStatus::Live
      when "DEPRECATED" then ACF::DeprecatedStatus::Deprecated
      else
        nil
      end
    end
  end
end
