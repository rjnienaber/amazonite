private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SpotInstanceState
    Open
    Active
    Closed
    Cancelled
    Failed
    Disabled

    def self.to_json(e : SpotInstanceState, json : JSON::Builder) : Nil
      value = case e
              when AEC::SpotInstanceState::Open      then "open"
              when AEC::SpotInstanceState::Active    then "active"
              when AEC::SpotInstanceState::Closed    then "closed"
              when AEC::SpotInstanceState::Cancelled then "cancelled"
              when AEC::SpotInstanceState::Failed    then "failed"
              when AEC::SpotInstanceState::Disabled  then "disabled"
              else
                raise Exception.new("unknown enum value for 'SpotInstanceState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SpotInstanceState
      value = pull.read_string
      case value
      when "open"      then AEC::SpotInstanceState::Open
      when "active"    then AEC::SpotInstanceState::Active
      when "closed"    then AEC::SpotInstanceState::Closed
      when "cancelled" then AEC::SpotInstanceState::Cancelled
      when "failed"    then AEC::SpotInstanceState::Failed
      when "disabled"  then AEC::SpotInstanceState::Disabled
      else
        raise Exception.new("unknown enum value for 'SpotInstanceState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SpotInstanceState::Open      then "open"
      when AEC::SpotInstanceState::Active    then "active"
      when AEC::SpotInstanceState::Closed    then "closed"
      when AEC::SpotInstanceState::Cancelled then "cancelled"
      when AEC::SpotInstanceState::Failed    then "failed"
      when AEC::SpotInstanceState::Disabled  then "disabled"
      else
        raise Exception.new("unknown enum value for 'SpotInstanceState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SpotInstanceState?
      case key
      when "open"      then AEC::SpotInstanceState::Open
      when "active"    then AEC::SpotInstanceState::Active
      when "closed"    then AEC::SpotInstanceState::Closed
      when "cancelled" then AEC::SpotInstanceState::Cancelled
      when "failed"    then AEC::SpotInstanceState::Failed
      when "disabled"  then AEC::SpotInstanceState::Disabled
      else
        nil
      end
    end
  end
end
