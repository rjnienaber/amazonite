private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetStateCode
    Submitted
    Active
    Deleted
    Failed
    DeletedRunning
    DeletedTerminating
    Modifying

    def self.to_json(e : FleetStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetStateCode::Submitted          then "submitted"
              when AEC::FleetStateCode::Active             then "active"
              when AEC::FleetStateCode::Deleted            then "deleted"
              when AEC::FleetStateCode::Failed             then "failed"
              when AEC::FleetStateCode::DeletedRunning     then "deleted_running"
              when AEC::FleetStateCode::DeletedTerminating then "deleted_terminating"
              when AEC::FleetStateCode::Modifying          then "modifying"
              else
                raise Exception.new("unknown enum value for 'FleetStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetStateCode
      value = pull.read_string
      case value
      when "submitted"           then AEC::FleetStateCode::Submitted
      when "active"              then AEC::FleetStateCode::Active
      when "deleted"             then AEC::FleetStateCode::Deleted
      when "failed"              then AEC::FleetStateCode::Failed
      when "deleted_running"     then AEC::FleetStateCode::DeletedRunning
      when "deleted_terminating" then AEC::FleetStateCode::DeletedTerminating
      when "modifying"           then AEC::FleetStateCode::Modifying
      else
        raise Exception.new("unknown enum value for 'FleetStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetStateCode::Submitted          then "submitted"
      when AEC::FleetStateCode::Active             then "active"
      when AEC::FleetStateCode::Deleted            then "deleted"
      when AEC::FleetStateCode::Failed             then "failed"
      when AEC::FleetStateCode::DeletedRunning     then "deleted_running"
      when AEC::FleetStateCode::DeletedTerminating then "deleted_terminating"
      when AEC::FleetStateCode::Modifying          then "modifying"
      else
        raise Exception.new("unknown enum value for 'FleetStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetStateCode?
      case key
      when "submitted"           then AEC::FleetStateCode::Submitted
      when "active"              then AEC::FleetStateCode::Active
      when "deleted"             then AEC::FleetStateCode::Deleted
      when "failed"              then AEC::FleetStateCode::Failed
      when "deleted_running"     then AEC::FleetStateCode::DeletedRunning
      when "deleted_terminating" then AEC::FleetStateCode::DeletedTerminating
      when "modifying"           then AEC::FleetStateCode::Modifying
      else
        nil
      end
    end
  end
end
