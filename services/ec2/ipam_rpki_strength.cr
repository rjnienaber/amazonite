private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The RPKI enforcement strength for route protection.
  enum IpamRpkiStrength
    Strict
    Permissive

    def self.to_json(e : IpamRpkiStrength, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamRpkiStrength::Strict     then "strict"
              when AEC::IpamRpkiStrength::Permissive then "permissive"
              else
                raise Exception.new("unknown enum value for 'IpamRpkiStrength' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamRpkiStrength
      value = pull.read_string
      case value
      when "strict"     then AEC::IpamRpkiStrength::Strict
      when "permissive" then AEC::IpamRpkiStrength::Permissive
      else
        raise Exception.new("unknown enum value for 'IpamRpkiStrength' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamRpkiStrength::Strict     then "strict"
      when AEC::IpamRpkiStrength::Permissive then "permissive"
      else
        raise Exception.new("unknown enum value for 'IpamRpkiStrength' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamRpkiStrength?
      case key
      when "strict"     then AEC::IpamRpkiStrength::Strict
      when "permissive" then AEC::IpamRpkiStrength::Permissive
      else
        nil
      end
    end
  end
end
