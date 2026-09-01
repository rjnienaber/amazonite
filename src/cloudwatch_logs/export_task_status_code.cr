private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum ExportTaskStatusCode
    Cancelled
    Completed
    Failed
    Pending
    PendingCancel
    Running

    def self.to_json(e : ExportTaskStatusCode, json : JSON::Builder) : Nil
      value = case e
              when ACWL::ExportTaskStatusCode::Cancelled     then "CANCELLED"
              when ACWL::ExportTaskStatusCode::Completed     then "COMPLETED"
              when ACWL::ExportTaskStatusCode::Failed        then "FAILED"
              when ACWL::ExportTaskStatusCode::Pending       then "PENDING"
              when ACWL::ExportTaskStatusCode::PendingCancel then "PENDING_CANCEL"
              when ACWL::ExportTaskStatusCode::Running       then "RUNNING"
              else
                raise Exception.new("unknown enum value for 'ExportTaskStatusCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::ExportTaskStatusCode
      value = pull.read_string
      case value
      when "CANCELLED"      then ACWL::ExportTaskStatusCode::Cancelled
      when "COMPLETED"      then ACWL::ExportTaskStatusCode::Completed
      when "FAILED"         then ACWL::ExportTaskStatusCode::Failed
      when "PENDING"        then ACWL::ExportTaskStatusCode::Pending
      when "PENDING_CANCEL" then ACWL::ExportTaskStatusCode::PendingCancel
      when "RUNNING"        then ACWL::ExportTaskStatusCode::Running
      else
        raise Exception.new("unknown enum value for 'ExportTaskStatusCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::ExportTaskStatusCode::Cancelled     then "CANCELLED"
      when ACWL::ExportTaskStatusCode::Completed     then "COMPLETED"
      when ACWL::ExportTaskStatusCode::Failed        then "FAILED"
      when ACWL::ExportTaskStatusCode::Pending       then "PENDING"
      when ACWL::ExportTaskStatusCode::PendingCancel then "PENDING_CANCEL"
      when ACWL::ExportTaskStatusCode::Running       then "RUNNING"
      else
        raise Exception.new("unknown enum value for 'ExportTaskStatusCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::ExportTaskStatusCode?
      case key
      when "CANCELLED"      then ACWL::ExportTaskStatusCode::Cancelled
      when "COMPLETED"      then ACWL::ExportTaskStatusCode::Completed
      when "FAILED"         then ACWL::ExportTaskStatusCode::Failed
      when "PENDING"        then ACWL::ExportTaskStatusCode::Pending
      when "PENDING_CANCEL" then ACWL::ExportTaskStatusCode::PendingCancel
      when "RUNNING"        then ACWL::ExportTaskStatusCode::Running
      else
        nil
      end
    end
  end
end
