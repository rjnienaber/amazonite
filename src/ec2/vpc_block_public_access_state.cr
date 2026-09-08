private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcBlockPublicAccessState
    DefaultState
    UpdateInProgress
    UpdateComplete

    def self.to_json(e : VpcBlockPublicAccessState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcBlockPublicAccessState::DefaultState     then "default-state"
              when AEC::VpcBlockPublicAccessState::UpdateInProgress then "update-in-progress"
              when AEC::VpcBlockPublicAccessState::UpdateComplete   then "update-complete"
              else
                raise Exception.new("unknown enum value for 'VpcBlockPublicAccessState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcBlockPublicAccessState
      value = pull.read_string
      case value
      when "default-state"      then AEC::VpcBlockPublicAccessState::DefaultState
      when "update-in-progress" then AEC::VpcBlockPublicAccessState::UpdateInProgress
      when "update-complete"    then AEC::VpcBlockPublicAccessState::UpdateComplete
      else
        raise Exception.new("unknown enum value for 'VpcBlockPublicAccessState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcBlockPublicAccessState::DefaultState     then "default-state"
      when AEC::VpcBlockPublicAccessState::UpdateInProgress then "update-in-progress"
      when AEC::VpcBlockPublicAccessState::UpdateComplete   then "update-complete"
      else
        raise Exception.new("unknown enum value for 'VpcBlockPublicAccessState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcBlockPublicAccessState?
      case key
      when "default-state"      then AEC::VpcBlockPublicAccessState::DefaultState
      when "update-in-progress" then AEC::VpcBlockPublicAccessState::UpdateInProgress
      when "update-complete"    then AEC::VpcBlockPublicAccessState::UpdateComplete
      else
        nil
      end
    end
  end
end
