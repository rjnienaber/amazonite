private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ServiceLinkVirtualInterfaceConfigurationState
    Pending
    Available
    Deleting
    Deleted

    def self.to_json(e : ServiceLinkVirtualInterfaceConfigurationState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ServiceLinkVirtualInterfaceConfigurationState::Pending   then "pending"
              when AEC::ServiceLinkVirtualInterfaceConfigurationState::Available then "available"
              when AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleting  then "deleting"
              when AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleted   then "deleted"
              else
                raise Exception.new("unknown enum value for 'ServiceLinkVirtualInterfaceConfigurationState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ServiceLinkVirtualInterfaceConfigurationState
      value = pull.read_string
      case value
      when "pending"   then AEC::ServiceLinkVirtualInterfaceConfigurationState::Pending
      when "available" then AEC::ServiceLinkVirtualInterfaceConfigurationState::Available
      when "deleting"  then AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleting
      when "deleted"   then AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleted
      else
        raise Exception.new("unknown enum value for 'ServiceLinkVirtualInterfaceConfigurationState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ServiceLinkVirtualInterfaceConfigurationState::Pending   then "pending"
      when AEC::ServiceLinkVirtualInterfaceConfigurationState::Available then "available"
      when AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleting  then "deleting"
      when AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleted   then "deleted"
      else
        raise Exception.new("unknown enum value for 'ServiceLinkVirtualInterfaceConfigurationState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ServiceLinkVirtualInterfaceConfigurationState?
      case key
      when "pending"   then AEC::ServiceLinkVirtualInterfaceConfigurationState::Pending
      when "available" then AEC::ServiceLinkVirtualInterfaceConfigurationState::Available
      when "deleting"  then AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleting
      when "deleted"   then AEC::ServiceLinkVirtualInterfaceConfigurationState::Deleted
      else
        nil
      end
    end
  end
end
