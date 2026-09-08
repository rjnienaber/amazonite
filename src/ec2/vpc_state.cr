private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcState
    Pending
    Available
    Deleting

    def self.to_json(e : VpcState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcState::Pending   then "pending"
              when AEC::VpcState::Available then "available"
              when AEC::VpcState::Deleting  then "deleting"
              else
                raise Exception.new("unknown enum value for 'VpcState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcState
      value = pull.read_string
      case value
      when "pending"   then AEC::VpcState::Pending
      when "available" then AEC::VpcState::Available
      when "deleting"  then AEC::VpcState::Deleting
      else
        raise Exception.new("unknown enum value for 'VpcState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcState::Pending   then "pending"
      when AEC::VpcState::Available then "available"
      when AEC::VpcState::Deleting  then "deleting"
      else
        raise Exception.new("unknown enum value for 'VpcState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcState?
      case key
      when "pending"   then AEC::VpcState::Pending
      when "available" then AEC::VpcState::Available
      when "deleting"  then AEC::VpcState::Deleting
      else
        nil
      end
    end
  end
end
