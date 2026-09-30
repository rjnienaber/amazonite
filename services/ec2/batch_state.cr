private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BatchState
    Submitted
    Active
    Cancelled
    Failed
    CancelledRunning
    CancelledTerminating
    Modifying

    def self.to_json(e : BatchState, json : JSON::Builder) : Nil
      value = case e
              when AEC::BatchState::Submitted            then "submitted"
              when AEC::BatchState::Active               then "active"
              when AEC::BatchState::Cancelled            then "cancelled"
              when AEC::BatchState::Failed               then "failed"
              when AEC::BatchState::CancelledRunning     then "cancelled_running"
              when AEC::BatchState::CancelledTerminating then "cancelled_terminating"
              when AEC::BatchState::Modifying            then "modifying"
              else
                raise Exception.new("unknown enum value for 'BatchState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BatchState
      value = pull.read_string
      case value
      when "submitted"             then AEC::BatchState::Submitted
      when "active"                then AEC::BatchState::Active
      when "cancelled"             then AEC::BatchState::Cancelled
      when "failed"                then AEC::BatchState::Failed
      when "cancelled_running"     then AEC::BatchState::CancelledRunning
      when "cancelled_terminating" then AEC::BatchState::CancelledTerminating
      when "modifying"             then AEC::BatchState::Modifying
      else
        raise Exception.new("unknown enum value for 'BatchState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BatchState::Submitted            then "submitted"
      when AEC::BatchState::Active               then "active"
      when AEC::BatchState::Cancelled            then "cancelled"
      when AEC::BatchState::Failed               then "failed"
      when AEC::BatchState::CancelledRunning     then "cancelled_running"
      when AEC::BatchState::CancelledTerminating then "cancelled_terminating"
      when AEC::BatchState::Modifying            then "modifying"
      else
        raise Exception.new("unknown enum value for 'BatchState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BatchState?
      case key
      when "submitted"             then AEC::BatchState::Submitted
      when "active"                then AEC::BatchState::Active
      when "cancelled"             then AEC::BatchState::Cancelled
      when "failed"                then AEC::BatchState::Failed
      when "cancelled_running"     then AEC::BatchState::CancelledRunning
      when "cancelled_terminating" then AEC::BatchState::CancelledTerminating
      when "modifying"             then AEC::BatchState::Modifying
      else
        nil
      end
    end
  end
end
