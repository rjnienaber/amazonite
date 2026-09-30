private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BundleTaskState
    Pending
    WaitingForShutdown
    Bundling
    Storing
    Cancelling
    Complete
    Failed

    def self.to_json(e : BundleTaskState, json : JSON::Builder) : Nil
      value = case e
              when AEC::BundleTaskState::Pending            then "pending"
              when AEC::BundleTaskState::WaitingForShutdown then "waiting-for-shutdown"
              when AEC::BundleTaskState::Bundling           then "bundling"
              when AEC::BundleTaskState::Storing            then "storing"
              when AEC::BundleTaskState::Cancelling         then "cancelling"
              when AEC::BundleTaskState::Complete           then "complete"
              when AEC::BundleTaskState::Failed             then "failed"
              else
                raise Exception.new("unknown enum value for 'BundleTaskState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BundleTaskState
      value = pull.read_string
      case value
      when "pending"              then AEC::BundleTaskState::Pending
      when "waiting-for-shutdown" then AEC::BundleTaskState::WaitingForShutdown
      when "bundling"             then AEC::BundleTaskState::Bundling
      when "storing"              then AEC::BundleTaskState::Storing
      when "cancelling"           then AEC::BundleTaskState::Cancelling
      when "complete"             then AEC::BundleTaskState::Complete
      when "failed"               then AEC::BundleTaskState::Failed
      else
        raise Exception.new("unknown enum value for 'BundleTaskState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BundleTaskState::Pending            then "pending"
      when AEC::BundleTaskState::WaitingForShutdown then "waiting-for-shutdown"
      when AEC::BundleTaskState::Bundling           then "bundling"
      when AEC::BundleTaskState::Storing            then "storing"
      when AEC::BundleTaskState::Cancelling         then "cancelling"
      when AEC::BundleTaskState::Complete           then "complete"
      when AEC::BundleTaskState::Failed             then "failed"
      else
        raise Exception.new("unknown enum value for 'BundleTaskState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BundleTaskState?
      case key
      when "pending"              then AEC::BundleTaskState::Pending
      when "waiting-for-shutdown" then AEC::BundleTaskState::WaitingForShutdown
      when "bundling"             then AEC::BundleTaskState::Bundling
      when "storing"              then AEC::BundleTaskState::Storing
      when "cancelling"           then AEC::BundleTaskState::Cancelling
      when "complete"             then AEC::BundleTaskState::Complete
      when "failed"               then AEC::BundleTaskState::Failed
      else
        nil
      end
    end
  end
end
