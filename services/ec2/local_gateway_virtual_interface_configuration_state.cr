private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocalGatewayVirtualInterfaceConfigurationState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : LocalGatewayVirtualInterfaceConfigurationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocalGatewayVirtualInterfaceConfigurationState::Pending   then "pending"
              when AEC::LocalGatewayVirtualInterfaceConfigurationState::Available then "available"
              when AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleting  then "deleting"
              when AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'LocalGatewayVirtualInterfaceConfigurationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocalGatewayVirtualInterfaceConfigurationState
      value = pull.read_string
      case value
      when "pending"   then AEC::LocalGatewayVirtualInterfaceConfigurationState::Pending
      when "available" then AEC::LocalGatewayVirtualInterfaceConfigurationState::Available
      when "deleting"  then AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleting
      when "deleted"   then AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleted
      else
        raise Exception.new("unknown enum value for 'LocalGatewayVirtualInterfaceConfigurationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocalGatewayVirtualInterfaceConfigurationState::Pending   then "pending"
      when AEC::LocalGatewayVirtualInterfaceConfigurationState::Available then "available"
      when AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleting  then "deleting"
      when AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'LocalGatewayVirtualInterfaceConfigurationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocalGatewayVirtualInterfaceConfigurationState?
      case key
      when "pending"   then AEC::LocalGatewayVirtualInterfaceConfigurationState::Pending
      when "available" then AEC::LocalGatewayVirtualInterfaceConfigurationState::Available
      when "deleting"  then AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleting
      when "deleted"   then AEC::LocalGatewayVirtualInterfaceConfigurationState::Deleted
      else
        nil
      end
    end
  end
end
