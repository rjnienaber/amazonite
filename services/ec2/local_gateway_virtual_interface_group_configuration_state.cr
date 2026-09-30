private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocalGatewayVirtualInterfaceGroupConfigurationState
    Pending
    Incomplete
    Available
    Deleting
    Deleted

    def self.to_json(e : LocalGatewayVirtualInterfaceGroupConfigurationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Pending    then "pending"
              when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Incomplete then "incomplete"
              when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Available  then "available"
              when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleting   then "deleting"
              when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleted    then "deleted"
              else
                raise Exception.new("unknown enum value for 'LocalGatewayVirtualInterfaceGroupConfigurationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocalGatewayVirtualInterfaceGroupConfigurationState
      value = pull.read_string
      case value
      when "pending"    then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Pending
      when "incomplete" then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Incomplete
      when "available"  then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Available
      when "deleting"   then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleting
      when "deleted"    then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleted
      else
        raise Exception.new("unknown enum value for 'LocalGatewayVirtualInterfaceGroupConfigurationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Pending    then "pending"
      when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Incomplete then "incomplete"
      when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Available  then "available"
      when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleting   then "deleting"
      when AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleted    then "deleted"
      else
        raise Exception.new("unknown enum value for 'LocalGatewayVirtualInterfaceGroupConfigurationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocalGatewayVirtualInterfaceGroupConfigurationState?
      case key
      when "pending"    then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Pending
      when "incomplete" then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Incomplete
      when "available"  then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Available
      when "deleting"   then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleting
      when "deleted"    then AEC::LocalGatewayVirtualInterfaceGroupConfigurationState::Deleted
      else
        nil
      end
    end
  end
end
