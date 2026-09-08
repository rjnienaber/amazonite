private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReportState
    Running
    Cancelled
    Complete
    Error

    def self.to_json(e : ReportState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReportState::Running   then "running"
              when AEC::ReportState::Cancelled then "cancelled"
              when AEC::ReportState::Complete  then "complete"
              when AEC::ReportState::Error     then "error"
              else
                raise Exception.new("unknown enum value for 'ReportState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReportState
      value = pull.read_string
      case value
      when "running"   then AEC::ReportState::Running
      when "cancelled" then AEC::ReportState::Cancelled
      when "complete"  then AEC::ReportState::Complete
      when "error"     then AEC::ReportState::Error
      else
        raise Exception.new("unknown enum value for 'ReportState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReportState::Running   then "running"
      when AEC::ReportState::Cancelled then "cancelled"
      when AEC::ReportState::Complete  then "complete"
      when AEC::ReportState::Error     then "error"
      else
        raise Exception.new("unknown enum value for 'ReportState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReportState?
      case key
      when "running"   then AEC::ReportState::Running
      when "cancelled" then AEC::ReportState::Cancelled
      when "complete"  then AEC::ReportState::Complete
      when "error"     then AEC::ReportState::Error
      else
        nil
      end
    end
  end
end
