private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MultipathResilienceMode
    AlwaysOn

    def self.to_json(e : MultipathResilienceMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::MultipathResilienceMode::AlwaysOn then "always-on"
              else
                raise Exception.new("unknown enum value for 'MultipathResilienceMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MultipathResilienceMode
      value = pull.read_string
      case value
      when "always-on" then AEC::MultipathResilienceMode::AlwaysOn
      else
        raise Exception.new("unknown enum value for 'MultipathResilienceMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MultipathResilienceMode::AlwaysOn then "always-on"
      else
        raise Exception.new("unknown enum value for 'MultipathResilienceMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MultipathResilienceMode?
      case key
      when "always-on" then AEC::MultipathResilienceMode::AlwaysOn
      else
        nil
      end
    end
  end
end
