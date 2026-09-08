private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerPeerState
    Pending
    Available
    Deleting
    Deleted
    Failing
    Failed

    def self.to_json(e : RouteServerPeerState, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerPeerState::Pending   then "pending"
              when AEC::RouteServerPeerState::Available then "available"
              when AEC::RouteServerPeerState::Deleting  then "deleting"
              when AEC::RouteServerPeerState::Deleted   then "deleted"
              when AEC::RouteServerPeerState::Failing   then "failing"
              when AEC::RouteServerPeerState::Failed    then "failed"
              else
                raise Exception.new("unknown enum value for 'RouteServerPeerState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerPeerState
      value = pull.read_string
      case value
      when "pending"   then AEC::RouteServerPeerState::Pending
      when "available" then AEC::RouteServerPeerState::Available
      when "deleting"  then AEC::RouteServerPeerState::Deleting
      when "deleted"   then AEC::RouteServerPeerState::Deleted
      when "failing"   then AEC::RouteServerPeerState::Failing
      when "failed"    then AEC::RouteServerPeerState::Failed
      else
        raise Exception.new("unknown enum value for 'RouteServerPeerState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerPeerState::Pending   then "pending"
      when AEC::RouteServerPeerState::Available then "available"
      when AEC::RouteServerPeerState::Deleting  then "deleting"
      when AEC::RouteServerPeerState::Deleted   then "deleted"
      when AEC::RouteServerPeerState::Failing   then "failing"
      when AEC::RouteServerPeerState::Failed    then "failed"
      else
        raise Exception.new("unknown enum value for 'RouteServerPeerState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerPeerState?
      case key
      when "pending"   then AEC::RouteServerPeerState::Pending
      when "available" then AEC::RouteServerPeerState::Available
      when "deleting"  then AEC::RouteServerPeerState::Deleting
      when "deleted"   then AEC::RouteServerPeerState::Deleted
      when "failing"   then AEC::RouteServerPeerState::Failing
      when "failed"    then AEC::RouteServerPeerState::Failed
      else
        nil
      end
    end
  end
end
