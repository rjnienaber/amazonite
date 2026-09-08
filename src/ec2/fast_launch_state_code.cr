private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FastLaunchStateCode
    Enabling
    EnablingFailed
    Enabled
    EnabledFailed
    Disabling
    DisablingFailed

    def self.to_json(e : FastLaunchStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::FastLaunchStateCode::Enabling        then "enabling"
              when AEC::FastLaunchStateCode::EnablingFailed  then "enabling-failed"
              when AEC::FastLaunchStateCode::Enabled         then "enabled"
              when AEC::FastLaunchStateCode::EnabledFailed   then "enabled-failed"
              when AEC::FastLaunchStateCode::Disabling       then "disabling"
              when AEC::FastLaunchStateCode::DisablingFailed then "disabling-failed"
              else
                raise Exception.new("unknown enum value for 'FastLaunchStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FastLaunchStateCode
      value = pull.read_string
      case value
      when "enabling"         then AEC::FastLaunchStateCode::Enabling
      when "enabling-failed"  then AEC::FastLaunchStateCode::EnablingFailed
      when "enabled"          then AEC::FastLaunchStateCode::Enabled
      when "enabled-failed"   then AEC::FastLaunchStateCode::EnabledFailed
      when "disabling"        then AEC::FastLaunchStateCode::Disabling
      when "disabling-failed" then AEC::FastLaunchStateCode::DisablingFailed
      else
        raise Exception.new("unknown enum value for 'FastLaunchStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FastLaunchStateCode::Enabling        then "enabling"
      when AEC::FastLaunchStateCode::EnablingFailed  then "enabling-failed"
      when AEC::FastLaunchStateCode::Enabled         then "enabled"
      when AEC::FastLaunchStateCode::EnabledFailed   then "enabled-failed"
      when AEC::FastLaunchStateCode::Disabling       then "disabling"
      when AEC::FastLaunchStateCode::DisablingFailed then "disabling-failed"
      else
        raise Exception.new("unknown enum value for 'FastLaunchStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FastLaunchStateCode?
      case key
      when "enabling"         then AEC::FastLaunchStateCode::Enabling
      when "enabling-failed"  then AEC::FastLaunchStateCode::EnablingFailed
      when "enabled"          then AEC::FastLaunchStateCode::Enabled
      when "enabled-failed"   then AEC::FastLaunchStateCode::EnabledFailed
      when "disabling"        then AEC::FastLaunchStateCode::Disabling
      when "disabling-failed" then AEC::FastLaunchStateCode::DisablingFailed
      else
        nil
      end
    end
  end
end
