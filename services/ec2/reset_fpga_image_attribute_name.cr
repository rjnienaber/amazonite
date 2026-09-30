private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ResetFpgaImageAttributeName
    LoadPermission

    def self.to_json(e : ResetFpgaImageAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::ResetFpgaImageAttributeName::LoadPermission then "loadPermission"
              else
                raise Exception.new("unknown enum value for 'ResetFpgaImageAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ResetFpgaImageAttributeName
      value = pull.read_string
      case value
      when "loadPermission" then AEC::ResetFpgaImageAttributeName::LoadPermission
      else
        raise Exception.new("unknown enum value for 'ResetFpgaImageAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ResetFpgaImageAttributeName::LoadPermission then "loadPermission"
      else
        raise Exception.new("unknown enum value for 'ResetFpgaImageAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ResetFpgaImageAttributeName?
      case key
      when "loadPermission" then AEC::ResetFpgaImageAttributeName::LoadPermission
      else
        nil
      end
    end
  end
end
