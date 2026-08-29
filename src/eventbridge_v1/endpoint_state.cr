private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum EndpointState
    Active
    Creating
    Updating
    Deleting
    CreateFailed
    UpdateFailed
    DeleteFailed

    def self.to_json(e : EndpointState, json : JSON::Builder) : Nil
      value = case e
              when AEB::EndpointState::Active       then "ACTIVE"
              when AEB::EndpointState::Creating     then "CREATING"
              when AEB::EndpointState::Updating     then "UPDATING"
              when AEB::EndpointState::Deleting     then "DELETING"
              when AEB::EndpointState::CreateFailed then "CREATE_FAILED"
              when AEB::EndpointState::UpdateFailed then "UPDATE_FAILED"
              when AEB::EndpointState::DeleteFailed then "DELETE_FAILED"
              else
                raise Exception.new("unknown enum value for 'EndpointState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::EndpointState
      value = pull.read_string
      case value
      when "ACTIVE"        then AEB::EndpointState::Active
      when "CREATING"      then AEB::EndpointState::Creating
      when "UPDATING"      then AEB::EndpointState::Updating
      when "DELETING"      then AEB::EndpointState::Deleting
      when "CREATE_FAILED" then AEB::EndpointState::CreateFailed
      when "UPDATE_FAILED" then AEB::EndpointState::UpdateFailed
      when "DELETE_FAILED" then AEB::EndpointState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'EndpointState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::EndpointState::Active       then "ACTIVE"
      when AEB::EndpointState::Creating     then "CREATING"
      when AEB::EndpointState::Updating     then "UPDATING"
      when AEB::EndpointState::Deleting     then "DELETING"
      when AEB::EndpointState::CreateFailed then "CREATE_FAILED"
      when AEB::EndpointState::UpdateFailed then "UPDATE_FAILED"
      when AEB::EndpointState::DeleteFailed then "DELETE_FAILED"
      else
        raise Exception.new("unknown enum value for 'EndpointState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::EndpointState?
      case key
      when "ACTIVE"        then AEB::EndpointState::Active
      when "CREATING"      then AEB::EndpointState::Creating
      when "UPDATING"      then AEB::EndpointState::Updating
      when "DELETING"      then AEB::EndpointState::Deleting
      when "CREATE_FAILED" then AEB::EndpointState::CreateFailed
      when "UPDATE_FAILED" then AEB::EndpointState::UpdateFailed
      when "DELETE_FAILED" then AEB::EndpointState::DeleteFailed
      else
        nil
      end
    end
  end
end
