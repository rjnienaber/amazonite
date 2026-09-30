private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SelfServicePortal
    Enabled
    Disabled

    def self.to_json(e : SelfServicePortal, json : JSON::Builder) : Nil
      value = case e
              when AEC::SelfServicePortal::Enabled  then "enabled"
              when AEC::SelfServicePortal::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'SelfServicePortal' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SelfServicePortal
      value = pull.read_string
      case value
      when "enabled"  then AEC::SelfServicePortal::Enabled
      when "disabled" then AEC::SelfServicePortal::Disabled
      else
        raise Exception.new("unknown enum value for 'SelfServicePortal' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SelfServicePortal::Enabled  then "enabled"
      when AEC::SelfServicePortal::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'SelfServicePortal' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SelfServicePortal?
      case key
      when "enabled"  then AEC::SelfServicePortal::Enabled
      when "disabled" then AEC::SelfServicePortal::Disabled
      else
        nil
      end
    end
  end
end
