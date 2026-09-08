private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LaunchTemplateHttpTokensState
    Optional
    Required

    def self.to_json(e : LaunchTemplateHttpTokensState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LaunchTemplateHttpTokensState::Optional then "optional"
              when AEC::LaunchTemplateHttpTokensState::Required then "required"
              else
                raise Exception.new("unknown enum value for 'LaunchTemplateHttpTokensState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LaunchTemplateHttpTokensState
      value = pull.read_string
      case value
      when "optional" then AEC::LaunchTemplateHttpTokensState::Optional
      when "required" then AEC::LaunchTemplateHttpTokensState::Required
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateHttpTokensState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LaunchTemplateHttpTokensState::Optional then "optional"
      when AEC::LaunchTemplateHttpTokensState::Required then "required"
      else
        raise Exception.new("unknown enum value for 'LaunchTemplateHttpTokensState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LaunchTemplateHttpTokensState?
      case key
      when "optional" then AEC::LaunchTemplateHttpTokensState::Optional
      when "required" then AEC::LaunchTemplateHttpTokensState::Required
      else
        nil
      end
    end
  end
end
