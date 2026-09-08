private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Ec2InstanceConnectEndpointState
    CreateInProgress
    CreateComplete
    CreateFailed
    DeleteInProgress
    DeleteComplete
    DeleteFailed
    UpdateInProgress
    UpdateComplete
    UpdateFailed

    def self.to_json(e : Ec2InstanceConnectEndpointState, json : JSON::Builder) : Nil
      value = case e
              when AEC::Ec2InstanceConnectEndpointState::CreateInProgress then "create-in-progress"
              when AEC::Ec2InstanceConnectEndpointState::CreateComplete   then "create-complete"
              when AEC::Ec2InstanceConnectEndpointState::CreateFailed     then "create-failed"
              when AEC::Ec2InstanceConnectEndpointState::DeleteInProgress then "delete-in-progress"
              when AEC::Ec2InstanceConnectEndpointState::DeleteComplete   then "delete-complete"
              when AEC::Ec2InstanceConnectEndpointState::DeleteFailed     then "delete-failed"
              when AEC::Ec2InstanceConnectEndpointState::UpdateInProgress then "update-in-progress"
              when AEC::Ec2InstanceConnectEndpointState::UpdateComplete   then "update-complete"
              when AEC::Ec2InstanceConnectEndpointState::UpdateFailed     then "update-failed"
              else
                raise Exception.new("unknown enum value for 'Ec2InstanceConnectEndpointState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Ec2InstanceConnectEndpointState
      value = pull.read_string
      case value
      when "create-in-progress" then AEC::Ec2InstanceConnectEndpointState::CreateInProgress
      when "create-complete"    then AEC::Ec2InstanceConnectEndpointState::CreateComplete
      when "create-failed"      then AEC::Ec2InstanceConnectEndpointState::CreateFailed
      when "delete-in-progress" then AEC::Ec2InstanceConnectEndpointState::DeleteInProgress
      when "delete-complete"    then AEC::Ec2InstanceConnectEndpointState::DeleteComplete
      when "delete-failed"      then AEC::Ec2InstanceConnectEndpointState::DeleteFailed
      when "update-in-progress" then AEC::Ec2InstanceConnectEndpointState::UpdateInProgress
      when "update-complete"    then AEC::Ec2InstanceConnectEndpointState::UpdateComplete
      when "update-failed"      then AEC::Ec2InstanceConnectEndpointState::UpdateFailed
      else
        raise Exception.new("unknown enum value for 'Ec2InstanceConnectEndpointState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Ec2InstanceConnectEndpointState::CreateInProgress then "create-in-progress"
      when AEC::Ec2InstanceConnectEndpointState::CreateComplete   then "create-complete"
      when AEC::Ec2InstanceConnectEndpointState::CreateFailed     then "create-failed"
      when AEC::Ec2InstanceConnectEndpointState::DeleteInProgress then "delete-in-progress"
      when AEC::Ec2InstanceConnectEndpointState::DeleteComplete   then "delete-complete"
      when AEC::Ec2InstanceConnectEndpointState::DeleteFailed     then "delete-failed"
      when AEC::Ec2InstanceConnectEndpointState::UpdateInProgress then "update-in-progress"
      when AEC::Ec2InstanceConnectEndpointState::UpdateComplete   then "update-complete"
      when AEC::Ec2InstanceConnectEndpointState::UpdateFailed     then "update-failed"
      else
        raise Exception.new("unknown enum value for 'Ec2InstanceConnectEndpointState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Ec2InstanceConnectEndpointState?
      case key
      when "create-in-progress" then AEC::Ec2InstanceConnectEndpointState::CreateInProgress
      when "create-complete"    then AEC::Ec2InstanceConnectEndpointState::CreateComplete
      when "create-failed"      then AEC::Ec2InstanceConnectEndpointState::CreateFailed
      when "delete-in-progress" then AEC::Ec2InstanceConnectEndpointState::DeleteInProgress
      when "delete-complete"    then AEC::Ec2InstanceConnectEndpointState::DeleteComplete
      when "delete-failed"      then AEC::Ec2InstanceConnectEndpointState::DeleteFailed
      when "update-in-progress" then AEC::Ec2InstanceConnectEndpointState::UpdateInProgress
      when "update-complete"    then AEC::Ec2InstanceConnectEndpointState::UpdateComplete
      when "update-failed"      then AEC::Ec2InstanceConnectEndpointState::UpdateFailed
      else
        nil
      end
    end
  end
end
