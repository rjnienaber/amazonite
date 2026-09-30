private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerEndpointState
    Pending
    Available
    Deleting
    Deleted
    Failing
    Failed
    DeleteFailed

    def self.to_json(e : RouteServerEndpointState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerEndpointState::Pending      then "pending"
              when AEC::RouteServerEndpointState::Available    then "available"
              when AEC::RouteServerEndpointState::Deleting     then "deleting"
              when AEC::RouteServerEndpointState::Deleted      then "deleted"
              when AEC::RouteServerEndpointState::Failing      then "failing"
              when AEC::RouteServerEndpointState::Failed       then "failed"
              when AEC::RouteServerEndpointState::DeleteFailed then "delete-failed"
              else
                raise Exception.new("unknown enum value for 'RouteServerEndpointState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerEndpointState
      value = pull.read_string
      case value
      when "pending"       then AEC::RouteServerEndpointState::Pending
      when "available"     then AEC::RouteServerEndpointState::Available
      when "deleting"      then AEC::RouteServerEndpointState::Deleting
      when "deleted"       then AEC::RouteServerEndpointState::Deleted
      when "failing"       then AEC::RouteServerEndpointState::Failing
      when "failed"        then AEC::RouteServerEndpointState::Failed
      when "delete-failed" then AEC::RouteServerEndpointState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'RouteServerEndpointState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerEndpointState::Pending      then "pending"
      when AEC::RouteServerEndpointState::Available    then "available"
      when AEC::RouteServerEndpointState::Deleting     then "deleting"
      when AEC::RouteServerEndpointState::Deleted      then "deleted"
      when AEC::RouteServerEndpointState::Failing      then "failing"
      when AEC::RouteServerEndpointState::Failed       then "failed"
      when AEC::RouteServerEndpointState::DeleteFailed then "delete-failed"
      else
        raise Exception.new("unknown enum value for 'RouteServerEndpointState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerEndpointState?
      case key
      when "pending"       then AEC::RouteServerEndpointState::Pending
      when "available"     then AEC::RouteServerEndpointState::Available
      when "deleting"      then AEC::RouteServerEndpointState::Deleting
      when "deleted"       then AEC::RouteServerEndpointState::Deleted
      when "failing"       then AEC::RouteServerEndpointState::Failing
      when "failed"        then AEC::RouteServerEndpointState::Failed
      when "delete-failed" then AEC::RouteServerEndpointState::DeleteFailed
      else
        nil
      end
    end
  end
end
