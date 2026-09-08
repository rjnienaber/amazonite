private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ServiceState
    Pending
    Available
    Deleting
    Deleted
    Failed

    def self.to_json(e : ServiceState, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ServiceState
      value = pull.read_string
      case value
      when "Pending"   then AEC::ServiceState::Pending
      when "Available" then AEC::ServiceState::Available
      when "Deleting"  then AEC::ServiceState::Deleting
      when "Deleted"   then AEC::ServiceState::Deleted
      when "Failed"    then AEC::ServiceState::Failed
      else
        raise Exception.new("unknown enum value for 'ServiceState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::ServiceState?
      case key
      when "Pending"   then AEC::ServiceState::Pending
      when "Available" then AEC::ServiceState::Available
      when "Deleting"  then AEC::ServiceState::Deleting
      when "Deleted"   then AEC::ServiceState::Deleted
      when "Failed"    then AEC::ServiceState::Failed
      else
        nil
      end
    end
  end
end
